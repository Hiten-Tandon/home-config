{ pkgs, user, buildNuPlugin, ... }: {
  home = {
    username = user.name;
    homeDirectory = "/home/${user.name}";
    stateVersion = "25.05";

    packages = with pkgs; [ fzf ];

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
        configFile.source = ./config/config.nu;
        plugins = with pkgs.nushellPlugins; [ polars (buildNuPlugin {name = "plotters"; src = fetchFromGitHub {
          owner = "cptpiepmatz";
          repo = "nu-jupyter-kernel";
          rev = "nu_plugin_plotters/0.1.5+0.103.0";
          sha256 = "";
        }; cargoDepsHash = ""; }) ];
      };
      gh = {
        enable = true;
        settings = { editor = "nvim"; };
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
  };
}
