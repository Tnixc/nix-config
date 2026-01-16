{
  config,
  lib,
  pkgs,
  username,
  ...
}: let
  transmissionCustom = pkgs.transmission_4.overrideAttrs (old: {
    postInstall =
      (old.postInstall or "")
      + ''
        # Remove default web UI (transmission 4.x uses public_html)
        rm -rf $out/share/transmission/public_html
        
        # Copy custom web UI to public_html
        cp -r ${../../../extra/transmission-web} $out/share/transmission/public_html
      '';
  });

  settingsFile = pkgs.writeText "settings.json" (builtins.toJSON {
    # Download settings
    download-dir = "/Users/${username}/Downloads";
    incomplete-dir = "/Users/${username}/Downloads/.incomplete";
    incomplete-dir-enabled = true;

    # RPC settings - localhost only, no authentication
    rpc-enabled = true;
    rpc-bind-address = "127.0.0.1";
    rpc-port = 9091;
    rpc-authentication-required = false;
    rpc-host-whitelist-enabled = false;
    rpc-whitelist-enabled = true;
    rpc-whitelist = "127.0.0.1,::1";

    # Network settings
    peer-port = 51413;
    peer-port-random-on-start = false;
    port-forwarding-enabled = true;

    # Connection limits
    peer-limit-global = 9999;
    peer-limit-per-torrent = 999;

    speed-limit-down-enabled = false;
    speed-limit-up-enabled = false;

    encryption = 1; # prefer encrypted
    dht-enabled = true;
    lpd-enabled = true;
    pex-enabled = true;
    utp-enabled = true;
    
    start-added-torrents = true;
    trash-original-torrent-files = false;
  });
in {
  environment.systemPackages = [transmissionCustom];

  launchd.daemons.transmission = {
    serviceConfig = {
      ProgramArguments = [
        "${transmissionCustom}/bin/transmission-daemon"
        "--foreground"
        "--config-dir"
        "/Users/${username}/.config/transmission-daemon"
      ];
      KeepAlive = false; # Don't auto-restart
      RunAtLoad = false; # Don't start at boot
      StandardErrorPath = "/Users/${username}/Library/Logs/transmission-daemon.log";
      StandardOutPath = "/Users/${username}/Library/Logs/transmission-daemon.log";
      UserName = username;
    };
  };

  # Create config directory and settings on activation
  system.activationScripts.postActivation.text = lib.mkAfter ''
    echo "Setting up transmission-daemon configuration..."
    
    # Create config directory
    sudo -u ${username} mkdir -p /Users/${username}/.config/transmission-daemon
    
    # Copy settings if they don't exist
    if [ ! -f /Users/${username}/.config/transmission-daemon/settings.json ]; then
      sudo -u ${username} cp ${settingsFile} /Users/${username}/.config/transmission-daemon/settings.json
      echo "Created default transmission settings"
    else
      echo "Transmission settings already exist, skipping..."
    fi
    
    # Create download directories
    sudo -u ${username} mkdir -p /Users/${username}/Downloads/.incomplete
  '';
}
