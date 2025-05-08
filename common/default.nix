{
  pkgs,
  user,
  ...
}:
# let
#   buildNuPlugin = (import ../custom-modules/nupkgs.nix { inherit pkgs; }).buildNuPlugin;
# in
{
  home = {
    username = user.username;
    homeDirectory = "/home/${user.username}";
    stateVersion = "25.05";

    packages = with pkgs; [ fzf zen ];
    file = {
      ".config/nvim" = {
        source = ./config/nvim-config;
        recursive = true;
      };
    };
    sessionVariables = {
      EDITOR = "nvim";
      GIT_EDITOR = "nvim";
    };
  };

  programs = {
    home-manager.enable = true;
    git.enable = true;
    lf.enable = true;
    ripgrep.enable = true;
    btop = {
      enable = true;
      package = pkgs.btop-rocm;
      settings = {
        update_ms = 100;
        temp_scale = "kelvin";
      };
    };
    nushell = {
      enable = true;
      environmentVariables = {
        config = {
          show_banner = false;
          use_kitty_protocol = true;
        };
        EDITOR = pkgs.neovim;
      };
      envFile = ''
          $env.PATH = $env.PATH | append ["/var/lib/flatpak/exports/bin"]
          $env.XDG_CONFIG_DIRS = $"($env.XDG_CONFIG_DIRS):($env.HOME)/.config"
        '';
      extraConfig = ''
          export def nixos-rbld [] {
            let currDir = $"(pwd)"
            rm -rf $"($env.HOME)/.gtkrc-2.0"
            cd $"($env.HOME)/projects/my-config"
            sudo nix flake update
            sudo nixos-rebuild switch --flake $".#((open config.toml).user.name)" --impure
            lazygit
            cd $currDir
          }

          fastfetch
        '';
      plugins = with pkgs.nushellPlugins; [ polars ];
    };
    gh = {
      enable = true;
      settings = {
        editor = "nvim";
      };
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
      enableBashIntegration = true;
    };
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
      options = [ "--cmd cd" ];
    };
  };
}
