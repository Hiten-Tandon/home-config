{
  pkgs,
  user,
  ...
}:
rec {
  home = {
    inherit (user) username;
    stateVersion = "25.05";
    sessionVariables = {
      EDITOR = "${pkgs.helix}/bin/hx";
      GIT_EDITOR = "${pkgs.helix}/bin/hx";
    };
  };

  programs = {
    fd.enable = true;
    git.enable = true;
    ripgrep.enable = true;
    home-manager.enable = true;
    fzf.enable = true;

    fastfetch = {
      enable = true;
      settings = {
        logo.source = "nixos";
        display.separator = " : ";

        modules = [
          {
            type = "custom";
            format = "┌───────────────────────────────────────────────────────────┐";
          }
          {
            type = "os";
            key = "   OS";
            keyColor = "red";
          }
          {
            type = "kernel";
            key = "   Kernel";
            keyColor = "red";
          }
          {
            type = "packages";
            key = "  󰏓 Packages";
            keyColor = "green";
          }
          {
            type = "display";
            key = "  󰍹 Display";
            keyColor = "green";
          }
          {
            type = "wm";
            key = "  󰈩 WM";
            keyColor = "yellow";
          }
          {
            type = "shell";
            key = "   Shell";
            keyColor = "yellow";
          }
          {
            type = "terminal";
            key = "   Terminal";
            keyColor = "yellow";
          }
          {
            type = "custom";
            format = "└───────────────────────────────────────────────────────────┘";
          }
          "break"
          {
            type = "title";
            key = "  ";
          }
          {
            type = "custom";
            format = "┌──────────────────────────────────────────┐";
          }
          {
            type = "cpu";
            format = "{1}";
            key = "   CPU";
            keyColor = "blue";
          }
          {
            type = "gpu";
            format = "{2}";
            key = "   GPU";
            keyColor = "blue";
          }
          {
            type = "gpu";
            format = "{3}";
            key = "   GPU Driver";
            keyColor = "magenta";
          }
          {
            type = "memory";
            key = "    memory";
            keyColor = "magenta";
          }
          {
            type = "command";
            key = "  󱦟 OS Age ";
            keyColor = "31";
            text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
          }
          {
            type = "uptime";
            key = "  󱫐 Uptime ";
            keyColor = "red";
          }
          {
            type = "custom";
            format = "└──────────────────────────────────────────┘";
          }
        ];
      };
    };

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

      extraEnv = ''
        #! /bin/nu
        $env.PATH = $env.PATH | append [ '/var/lib/flatpak/exports/bin' ]
      '';

      extraConfig = ''
        #! /bin/nu
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
      settings.editor = "${pkgs.helix}/bin/hx";
    };

    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };

    starship = {
      enable = true;
      settings = (pkgs.lib.importTOML ./starship.toml);
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
