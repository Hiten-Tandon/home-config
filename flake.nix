{
  description = "This is for home-manager";

  inputs = {
    home-manager.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { home-manager, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        configTOML = builtins.fromTOML (builtins.readDir ./config.toml);
        user = configTOML.user;
        pkgs = import home-manager.nixpkgs { inherit system; };
      in {
        legacyPackages.homeConfigurations.${user.username} =
          home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            modules = [ ./common ]
              ++ pkgs.lib.optional pkgs.stdenv.isLinux ./linux
              ++ pkgs.lib.optional pkgs.stdenv.isDarwin ./darwin
              ++ pkgs.lib.optional pkgs.stdenv.isBSD ./bsd
              ++ pkgs.lib.optional pkgs.stdenv.isCygwin ./cygwin;
          };
      });
}
