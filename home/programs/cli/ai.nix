{pkgs, ...}: let
  ai = pkgs.writeShellScriptBin "ai" ''
    prompt="''${*:-say hello nothing else}"
    ${pkgs.curl}/bin/curl -sS https://opencode.ai/zen/v1/chat/completions \
      -H "Content-Type: application/json" \
      -d "$(${pkgs.jq}/bin/jq -n --arg p "$prompt" '{
        model: "deepseek-v4-flash-free",
        messages: [{role: "user", content: $p}]
      }')" \
      | ${pkgs.jq}/bin/jq -r .choices[0].message.content
  '';

  aic = pkgs.writeShellScriptBin "aic" ''
    set -euo pipefail

    auto=0
    if [ "''${1:-}" = "-y" ]; then
      auto=1
    fi

    diff="$(git diff HEAD)"
    if [ -z "$diff" ]; then
      echo "No changes to commit." >&2
      exit 1
    fi

    msg="$(${pkgs.gum}/bin/gum spin --show-output --spinner line --title "Generating commit message..." -- \
      ${ai}/bin/ai "Here's a git diff: $diff, write a commit message. Use conventional commits. Do not include anything else in your response")"

    if [ -z "$msg" ]; then
      echo "Failed to generate a commit message." >&2
      exit 1
    fi

    echo "$msg"

    if [ "$auto" -eq 1 ]; then
      git commit -am "$msg"
    else
      if ${pkgs.gum}/bin/gum confirm "Commit with this message?"; then
        git commit -am "$msg"
      else
        echo "Aborted." >&2
        exit 1
      fi
    fi
  '';
in {
  home.packages = [ai aic pkgs.gum];
}
