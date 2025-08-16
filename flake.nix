{
  description = "This is for home-manager";

  inputs = {
    nixpkgs-stable.url = "github:NixOS/nixpkgs/25.05";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";
    zen.url = "github:Hiten-Tandon/twilight-zen-browser-flake";
    wezterm.url = "github:wezterm/wezterm?dir=nix";
    stylix.url = "github:danth/stylix";
    fdm.url = "github:hiten-tandon/freedownloadmanager-nix";
    nixcord.url = "github:kaylorben/nixcord";
  };

  outputs =
    {
      home-manager,
      flake-utils,
      wezterm,
      nixpkgs,
      nixpkgs-stable,
      stylix,
      zen,
      fdm,
      nixcord,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            zen.overlay
            fdm.overlay
            (_: self: {
              wezterm = wezterm.outputs.packages.${self.system}.default;
            })
          ];
        };
        stable = import nixpkgs-stable {
          inherit system;
          overlays = [
            zen.overlay
            fdm.overlay
            (_: self: {
              wezterm = wezterm.outputs.packages.${self.system}.default;
            })
          ];
        };
        configTOML = builtins.fromTOML (builtins.readFile ./config.toml);
        user = configTOML.user;
      in
      with pkgs;
      {
        legacyPackages.homeConfigurations.${user.username} = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit user stable;
          };
          modules = [
            stylix.homeModules.stylix
            nixcord.homeModules.nixcord
            ./common
          ]
          ++ lib.optional stdenv.isLinux ./linux
          ++ lib.optional stdenv.isDarwin ./darwin
          ++ lib.optional stdenv.isBSD ./bsd
          ++ lib.optional stdenv.isCygwin ./cygwin;
        };
        formatter = nixfmt-tree;
      }
    );
}
