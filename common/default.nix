{
  pkgs,
  user,
  stable,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    inherit (user) username;
    stateVersion = "25.05";
    packages = with pkgs; [
      lazygit
      signal-desktop
      nil
      nixd
      marksman
      bash-language-server
      markdownlint-cli2
      marksman
      glab
      vivid
      home-manager
      libreoffice-qt6-fresh
    ];
    sessionVariables.GIT_EDITOR = "${pkgs.helix}/bin/hx";
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    polarity = "dark";
    icons = {
      enable = true;
      dark = "Papirus";
      light = "Papirus";
      package = pkgs.papirus-icon-theme;
    };
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    image = ./wallpaper.jpg;
    targets = {
      starship.enable = false;
      helix.enable = false;
      yazi.enable = false;
      vesktop.enable = false;
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono Nerd Font";
      };
    };
  };

  programs = {
    fd.enable = true;
    git.enable = true;
    ripgrep.enable = true;
    fzf.enable = true;
    obs-studio.enable = true;
    mpv.enable = true;
    darcs.enable = true;

    nh = {
      enable = true;
      clean.enable = true;
    };

    nixcord = {
      enable = true;
      discord = {
        enable = true;
        vencord.enable = true;
        package = pkgs.discord-canary;
      };
      vesktop = {
        enable = true;
        package = pkgs.vesktop;
      };
      dorion = {
        enable = false;
        blur = "none";
        cacheCss = true;
        desktopNotifications = true;
        multiInstance = true;
        openOnStartup = true;
        sysTray = true;
        streamerModeDetection = true;
        useNativeTitlebar = true;
        package = pkgs.dorion;
      };
      quickCss = builtins.readFile ./discord-theme.css;
      config = {
        autoUpdate = false;
        autoUpdateNotification = false;
        disableMinSize = true;
        frameless = true;
        notifyAboutUpdates = false;
        useQuickCss = true;
        plugins = {
          betterFolders = {
            enable = true;
            closeAllFolders = true;
            closeAllHomeButton = true;
            closeOthers = true;
            forceOpen = true;
            keepIcons = true;
          };
          betterGifPicker.enable = true;
          betterNotesBox.enable = true;
          betterRoleContext.enable = true;
          betterSessions.enable = true;
          betterSettings.enable = true;
          betterUploadButton.enable = true;
          biggerStreamPreview.enable = true;
          callTimer.enable = true;
          consoleJanitor.enable = true;
          copyFileContents.enable = true;
          fakeNitro.enable = true;
          fixImagesQuality.enable = true;
          forceOwnerCrown.enable = true;
          webKeybinds.enable = true;
          volumeBooster.enable = true;
        };
      };
    };

    wezterm = {
      enable = false; # broken
      extraConfig = builtins.readFile ./wezterm.lua;
    };

    ghostty = {
      enable = true;
      settings = {
        font-family = "JetBrainsMono Nerd Font";
        font-size = 16;
        focus-follows-mouse = true;
      };
    };

    helix = {
      enable = true;
      defaultEditor = true;
      settings = {
        editor = {
          auto-save = {
            after-delay.enable = true;
            focus-lost = true;
          };
          cursor-shape.insert = "bar";
          end-of-line-diagnostics = "hint";
          indent-guides.render = true;
          inline-diagnostics.cursor-line = "warning";
          insert-final-newline = false;
          line-number = "relative";
          lsp = {
            display-inlay-hints = true;
            display-progress-messages = true;
          };
          mouse = false;
          popup-border = "all";
          scrolloff = 100;
        };
        keys = {
          insert.C-s = ":w!";
          normal = {
            A-r = ":config-reload";
            C-s = ":w!";
            G = "@ge";
            H = ":bp";
            L = ":bn";
            space = {
              q = ":q";
              space = "@<space>f";
              w = ":w!";
              y = "@xy";
            };
          };
          select.G = "@ge";
        };
        theme = "rose_pine";
      };
    };
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
        edit_mode = "vi";
        filesize.unit = "binary";
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

      plugins = with pkgs.nushellPlugins; [ formats polars query gstat ];

      extraEnv = ''
        #! /bin/nu
        $env.EDITOR = "${pkgs.helix}/bin/hx";
        $env.GIT_EDITOR = "${pkgs.helix}/bin/hx";
        $env.NIX_USER_CONF_FILES = "$\"($env.HOME)/.config/nix\"";
        $env.PATH = $env.PATH | append [ '/var/lib/flatpak/exports/bin' ]
        $env.LS_COLORS = (vivid generate rose-pine)
      '';

      extraConfig = ''
        #! /bin/nu
        # clone a repo
        export def analyze-startup [] {
          systemd-analyze blame
            | lines
            | each { str trim | split column " " }
            | flatten
            | each {
              {
                service : $in.column2,
                time : ($in.column1 | str replace -r "[^m]s$" "sec" | into duration)
              }
            }
        }
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
          cd $"($env.HOME)/projects/nixos-config/my-config"
          if $update_flake {
            sudo nix flake update
          }
          sudo nixos-rebuild switch --flake $".#${user.username}" --impure
          if ((git status --short) | str length) != 0 {
            lazygit
          }
        }

        export def home-rbld [
          --update-flake(-u) # Update the flake before updating the configuration
        ] {
          try {
            rm $"($env.HOME)/.gtkrc-2.0"
            rm $"($env.HOME)/.gtkrc-2.0.backup"
          }
          cd $"($env.HOME)/projects/nixos-config/home-manager"
          if $update_flake {
            nix flake update
          }
          home-manager switch --flake ".#${user.username}"
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
        git_protocol = "ssh";
      };
      extensions = with pkgs; [
        gh-eco
        (stdenv.mkDerivation (finalAttrs: {
          src = fetchFromGitHub {
            owner = "mislav";
            repo = "gh-cp";
            rev = "58afdf5b5e1acfe71fce2390f6431003505ae0aa";
            sha256 = "Ih3Wit0nnB8PrgbeZEuhTNVPCrwMWBmKMJSGmgLIrVY=";
          };
          version = "1.0.0";
          pname = "gh-cp";

          installPhase = ''
            mkdir $out
            cp -r $src $out/bin
            chmod +x $out/bin/gh-cp
          '';

          meta = {
            description = "GitHub CLI extension to copy a file from a GitHub repository locally without cloning the repository.";
            homepage = "https://github.com/mislav/gh-cp";
            license = lib.licenses.unlicense;
          };
        }))
      ];
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

    freetube = {
      enable = true;
      settings = {
        checkForUpdates = false;
        defaultQuality = "1080";
        useSponsorBlock = true;
        useDeArrowTitles = true;
        useDeArrowThumbnails = true;
        externalPlayer = "mpv";
      };
    };

    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      options = [ "--cmd cd" ];
    };
  };

}
