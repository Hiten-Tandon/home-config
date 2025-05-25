{ pkgs, ... }:
with pkgs;
{
  buildNuPlugin =
    {
      name,
      src,
      cargoHash,
    }:
    rustPlatform.buildRustPackage {
      pname = "nushell_plugin_${name}";
      inherit (pkgs.nushell) version;
      inherit cargoHash src;

      useFetchCargoVendor = true;

      nativeBuildInputs = [ pkg-config ] ++ lib.optionals stdenv.cc.isClang [ rustPlatform.bindgenHook ];
      buildInputs = [
        openssl
        fontconfig
      ];
      cargoBuildFlags = [ "--package nu_plugin_${name}" ];

      passthru.updateScript = nix-update-script {
        extraArgs = [ "--version=skip" ];
      };

      meta.mainProgram = "nu_plugin_${name}";
    };
}
