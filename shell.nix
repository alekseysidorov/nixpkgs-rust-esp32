# Temporary shell file to check packages

{ pkgs ? import ./default.nix }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust support
    cargo-espflash
    espflash
    ldproxy
    espup
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];
}
