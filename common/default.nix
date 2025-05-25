{
  pkgs,
  user,
  ...
}: rec {
  home = {
    username = user.username;
    homeDirectory = "/home/${user.username}";
    stateVersion = "25.05";

    packages = with pkgs; [ fzf zen ];
    sessionVariables = {
      EDITOR = "${pkgs.helix}/bin/hx";
      GIT_EDITOR = "${pkgs.helix}/bin/hx";
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    ripgrep.enable = true;
    btop = {
      enable = true;
      package = pkgs.btop-rocm;
      settings = {
        update_ms = 100;
        temp_scale = "kelvin";
      };
    };
    yazi = {
      enable = true;
      enableNushellIntegration = true;
    };
    nushell = {
      enable = true;

      settings = {
        show_banner = false;
        use_kitty_protocol = true;
      };
      
      environmentVariables = {
        EDITOR = "${pkgs.helix}/bin/hx";
        GIT_EDITOR = "${pkgs.helix}/bin/hx";
        NIX_USER_CONF_FILES = "${home.homeDirectory}/.config/nix";
      };
      
      shellAliases = {
        vi = "${pkgs.helix}/bin/hx";
        vim = "${pkgs.helix}/bin/hx";
        ncim = "${pkgs.helix}/bin/hx";
        nvim = "${pkgs.helix}/bin/hx";
        helix = "${pkgs.helix}/bin/hx";
        fuckoff = "exit";
        la = "ls -a";
        ll = "ls -l";
        lla = "ls -la";
      };

      extraEnv = "$env.PATH = $env.PATH | append [ '/var/lib/flatpak/exports/bin' ]";

      extraConfig = ''
          # clone a repo
          export def --env clone-repo [
            repo: string, # The service provider and repo to clone (ex: github:Hiten-Tandon/my-nixos-distro)
            target?: string, # The target directory
            --https, # Use https protocol instead of the default ssh
            --cd(-c) # cd into the target after cloning
          ] {
            let url = if $https {
              $repo | str replace -r "(.*):(.*)" "https://$\{1}.com/$\{2}"
            } else {
              $repo | str replace -r "(.*):(.*)" "git@$\{1}.com:$\{2}"
            }

            let target = if ($target == null) {
              $repo | str replace -r ".*/(.*)" "$\{1}"
            } else {
              $target
            }

            git clone $url $target
            if $cd {
              cd $target
            }
          }

          # Rebuild nixos config
          # Example:
          # ```
          #   nixos-rbld -u
          # ```
          export def nixos-rbld [
            --update-flake(-u) # Update the flake before updating the configuration
          ] {
            rm -rf $"($env.HOME)/.gtkrc-2.0"
            cd $"($env.HOME)/projects/nixos-config/my-config"
            if $update_flake {
              sudo nix flake update
            }
            sudo nixos-rebuild switch --flake $".#((open config.toml).user.name)" --impure
            if ((git status --short) | str length) != 0 {
              lazygit
            }
          }

          fastfetch
        '';
    };
    gh = {
      enable = true;
      settings = {
        editor = "${pkgs.helix}/bin/hx";
      };
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      options = [ "--cmd cd" ];
    };
  };
}
