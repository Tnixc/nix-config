CRUSH.md for nix-config

Build / format / test
- Build darwin system: nix build .#darwinConfigurations.End.system
- Deploy (build + activate): just deploy
- Format Nix/Lua: just fmt (runs: nix fmt . && stylua . --sort-requires)
- Aerospace-sketchybar run: (in home/programs/aerospace-sketchybar) nix run
- Single test: no test suite in repo; validate flake: nix flake check

Repo layout
- Flake root: flake.nix; systems in modules/, home configs in home/
- Aerospace+Sketchybar flake at home/programs/aerospace-sketchybar

Style guidelines
- Nix: use alejandra formatting (nix fmt), prefer attrsets with trailing semicolons, keep inputs/outputs sections ordered and concise
- Lua (Neovim/Sketchybar): run stylua with --sort-requires; 2 spaces indent; snake_case for locals, PascalCase for modules where existing; avoid comments with secrets
- Shell in Justfiles: use simple targets; keep commands idempotent; avoid sudo except activation step
- JSON (Zed/Karabiner): compact objects, double-quotes, trailing commas avoided
- Import order: group stdlib/builtins first, then local modules; in Lua keep require() at file top
- Types: Lua is dynamic; keep tables documented by key names; Nix is typed by eval; prefer explicit attrs
- Naming: match existing: username, hostname, system vars; file names kebab-case or snake_case as seen
- Error handling: keep nix build failures actionable; avoid set -e in Just; check program availability before running

Copilot / Cursor rules
- No Cursor or Copilot rules present (.cursor/rules, .cursorrules, .github/copilot-instructions.md not found)

Tips for agents
- Never commit secrets; do not log keys
- Before running commands that change the system, explain and confirm
- If adding new build/lint/test commands, also add them to this CRUSH.md