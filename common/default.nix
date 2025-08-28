{
  pkgs,
  user,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  home = {
    inherit (user) username;
    stateVersion = "25.05";
    packages = with pkgs; [
      lazygit
      signal-desktop-source
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

    nh = {
      enable = true;
      clean.enable = true;
    };

    nixcord = {
      enable = true;
      discord = {
        enable = true;
        branch = "canary";
        vencord = {
          enable = true;
          unstable = true;
        };
        openASAR.enable = true;
      };
      # Disabled while broken
      # vesktop.enable = true;
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
      quickCss = ''
        /**
         * @name Rose Pine
         * @author InvraNet
         * @authorLink https://gitlab.com/Invranet
         * @description Soho vibes for discord.
         * @license GPLv3
         * @version 1.2.5
         * @authorId 488590546873483276
         * @discord invra.net
         **/

         .visual-refresh, .visual-refresh .theme-midnight, .visual-refresh .theme-dark, .visual-refresh .theme-ash, .visual-refresh .theme-light {
          --bg-brand: #cc9a99 !important;
          --background-base-lower: #181624 !important;
          --background-base-lowest: #191724 !important;
          --background-base-low: #1f1d2e !important;
          --background-primary: #1f1d2b !important;
          --background-secondary: #191822 !important;
          --background-tertiary: #1f1d2c !important;
          --bg-base-tertiary: #191724 !important;
          --bg-base-primary: #1f1d2b !important;
          --bg-base-secondary: #1d1b2b !important;
          --bg-surface-overlay: #171524 !important;
          --bg-surface-raised: #171524 !important;
          --background-surface-high: #1c1929 !important;
          --background-surface-higher: #1e1b2c !important;
          --background-surface-highest: #1b1825 !important;
          --background-secondary-alt: #1b1825 !important;
          --background-floating: #19162b !important;
          --card-primary-bg: #191724 !important;
          --custom-channel-members-bg: !important;
          --user-profile-overlay-background: #ffffff05 !important;

          --chat-background-default: #1f1d2e !important;

          --autocomplete-bg: #1b1927 !important;

          --modal-footer-background: #1a1927 !important;
          --modal-background: #161622 !important;

          --notice-background-positive: #9ccfd822 !important;
          --notice-background-critical: #eb6f9222 !important;
          --notice-background-warning: #f6c17722 !important;
          --background-mod-subtle: !important;

          --text-normal: #e8e5f8 !important;
          --header-primary: #e0def4 !important;
          --interactive-active: #dedcf0 !important;
          --header-secondary: #d5d3e9 !important;
          --text-primary: #e0def4 !important;
          --text-feedback-positive: #64bbca !important;
          --text-positive: #328f6b !important;
          --text-code-keyword: #eb6f92 !important;
          --text-code-string: #9ccfd8 !important;
          --text-code-title: #31748f !important;
          --text-code-variable: #64bbca !important;
          --green-400: #6c8a95 !important;
          --button-secondary-text: #cecacd;
          --text-link: #3e8fb0 !important;
          --text-tertiary: #908caa !important;
          --text-default: #b4b2c6 !important;
          --channels-default: #c1c0cd !important;
          --interactive-hover: #919099 !important;
          --embed-title: var(--header-primary) !important;
          --user-profile-border: #2d2c37 !important;
          --green-330: #9ccfd877 !important;
          --green-360: #6c8b96 !important;
          --red-400: #eb6f92;
          --opacity-blurple-16: #eb6f9216;

          --button-outline-danger-background: #eb6f9222 !important;
          --button-outline-danger-background-hover: #eb6f9233 !important;
          --button-outline-danger-text: #eb6f88 !important;
          --button-outline-danger-text-hover: var(--button-outline-danger-text) !important;
          --button-filled-brand-background: #c4a7e722 !important;
          --button-filled-brand-background-hover: #c4a7e733 !important;
          --button-filled-brand-text: #c4a7e7 !important;
          --button-filled-brand-text-hover: var(--button-outline-danger-text) !important;
        }



        .visual-refresh .tabBar__133bf .addFriend__133bf.addFriend__133bf.addFriend__133bf:hover {
          background-color: #c4a7e722;
        }

        .visual-refresh .tabBar__133bf .addFriend__133bf.addFriend__133bf.addFriend__133bf:active {
          background-color: #c4a7e733;
        }

        .visual-refresh .tabBar__133bf .addFriend__133bf.addFriend__133bf.addFriend__133bf {
          color: #c4a7e7;
          background: none;
        }

        .visual-refresh .tabBar__133bf .addFriend__133bf.addFriend__133bf.addFriend__133bf[aria-selected=true] {
          background-color: #c4a7e716;
          color: #c4a7e7;
        }

        .dark img[aria-label="Domain"],
        .dark img[alt="GitHub Logo"]
        .dark img[alt="Steam Logo"],
        .dark img[alt="X Logo"] {
          filter: invert() !important;
        }

        .container_a99829 {
          background: #ffffff10 !important;
        }

        .outer_c0bea0.user-profile-popout,
        :root .user-profile-modal, 
        :root .user-profile-popout,
        .outer_c0bea0.user-profile-sidebar {
          background: #1f1d2e !important;
          --profile-gradient-start: #2b293d !important;
          --profile-gradient-end: #2b293d !important;
          padding: 0 !important;
          --profile-gradient-primary-color: #2b293d !important;
          --profile-gradient-secondary-color: #2b293d !important;
          --profile-gradient-overlay-color: #2b293d !important;
          --profile-gradient-primary-color: #e0def4 !important;
          --profile-gradient-primary-color: #2b293d !important;
          --profile-gradient-primary-color: #2b293d !important;
          --profile-gradient-primary-color: #2b293d !important;
        }

        .footerButtonColor__7f9c0 {
          color: #908caa;
        }

        .custom-user-profile-theme .container_a99829 {
          border: 2px solid var(--input-border) !important;
        }

        .custom-user-profile-theme .themeColor_fb7f94.primary_fb7f94 {
          background: #2b293d;
        }

        .wrapper__44b0c[role="img"] > svg > circle {
          fill: none;
        }

        .custom-user-profile-theme .inner_c0bea0 {
          --profile-gradient-start: #2b293d !important;
          --profile-gradient-end: #2b293d !important;
          background: none !important;
        }

        #vc-spotify-progress-bar>[class^=slider]:hover [class^=barFill] {
          background-color: #ebbcba !important;
        }

        .vc-spotify-repeat-context,
        .vc-spotify-repeat-track,
        .vc-spotify-shuffle-on {
          background-color: #ebbcba22 !important;
        }

        .vc-spotify-repeat-context svg,
        .vc-spotify-repeat-track svg,
        .vc-spotify-shuffle-on svg {
          color: #ebbcba !important;
          fill: #ebbcba !important;
          stroke: #ebbcba !important;
        }

        .vcd-screen-picker-option-radio[data-checked=true] {
          background-color: var(--button-filled-brand-background) !important;
          border-color: var(--button-filled-brand-background) !important;
          color: var(--button-filled-brand-text) !important;
        }

        div.stack_dbd263 > .title__3e443, div.stack_dbd263 > div > div  > h3, 
        div.stack_dbd263 > div > div > div > div[role="radiogroup"],
        div.stack_dbd263 > div > div > div > div.divider__46c3b.divider_fbfab6 {
            display: none !important;
        }

        .avatar__68617.speaking__68617 {
          box-shadow: inset 0 0 0 2px #ebbcba,inset 0 0 0 3px var(--bg-base-secondary) !important;
        }

        .avatarSpeaking__44b0c {
          box-shadow: inset 0 0 0 2px #ebbcba,inset 0 0 0 3px var(--bg-base-secondary) !important;
        }

        .border_f910d0.speaking_f910d0 {
          box-shadow: inset 0 0 0 2px #ebbcba,inset 0 0 0 3px var(--bg-base-secondary) !important;
        }

        .border__2f4f7.speaking__2f4f7 {
          box-shadow: inset 0 0 0 2px #ebbcba,inset 0 0 0 3px var(--bg-base-secondary) !important;
        }

        .buttonSection__1405b {
          background-color: #1c1b25;
        }

        button.button__67645.redGlow__67645,
        span.button__67645.redGlow__67645 {
          background-color: #eb6f9221 !important;
        }

        button.button__67645.redGlow__67645 svg path {
          fill: #eb6f92 !important;
          stroke: #eb6f92 !important;
        }

        .addFriendInputWrapper__72ba7 {
          background-color: var(--background-base-low);
        }

        .container__87bf1.checked__87bf1 {
          background-color: #c4a7e799 !important;
        }

        .container__87bf1 {
          background-color: #26233a !important;
        }

        .experimentButton_e131a9 .buttonColor_e131a9.buttonActive_e131a9, .experimentButton_e131a9.buttonColor_e131a9.buttonActive_e131a9, .custom-theme-background .experimentButton_e131a9 .buttonColor_e131a9.buttonActive_e131a9, .custom-theme-background .experimentButton_e131a9.buttonColor_e131a9.buttonActive_e131a9 {
          background-color: #9ccfd833 !important;
        }

        .container_d1d9f3 circle {
          fill: #1f1d2e;
        }

        .callContainer_cb9592.theme-dark.theme-midnight {
          background: #191822 !important;
        }

        rect[mask="url(#svg-mask-status-online)"] {
          fill: #56949f;
        }

        rect[mask="url(#svg-mask-status-offline)"] {
          fill: #908caa;
        }

        rect[mask="url(#svg-mask-status-idle)"] {
          fill: #f6c177;
        }

        rect[mask="url(#svg-mask-status-dnd)"] {
          fill: #eb6f92;
        }

        .midnightIcon__36dee {
          background-color: #1f1d2e;
        }

        .theme-dark #vc-spotify-player {
          background-color: var(--background-base-high);
        }

        .bar_c38106.shortBar_c38106 {
          display: none;
        }

        .buttonSection__1405b.experimentButtonSection__1405b {
          background: #1e1b2c;
        }

        .visual-refresh .root_bfe55a {
          border-radius: 5px;
          overflow: hidden;
          background-color: var(--background-tertiary);
        }

        .gradientContainer_bfe55a {
          background-image: none !important;
        }
      '';
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
          clearURLs.enable = true;
          consoleJanitor.enable = true;
          copyFileContents.enable = true;
          copyUserURLs.enable = true;
          fakeNitro.enable = true;
          fixImagesQuality.enable = true;
          forceOwnerCrown.enable = true;
          replaceGoogleSearch = {
            enable = true;
            customEngineName = "DuckDuckGo";
            customEngineURL = "https://duckduckgo.com";
          };
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
        gtk-adwaita = false;
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
