# Temporary shell file to check packages

{ pkgs ? import <nixpkgs> { } }:
let
  # overlay packages
  cargo-espflash = pkgs.callPackage ./pkgs/cargo-espflash.nix { };
  ldproxy = pkgs.callPackage ./pkgs/ldproxy.nix { };
in
pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = [
    pkgs.libiconv
    pkgs.rustup
    pkgs.cargo-generate
    pkgs.cmake

    cargo-espflash
    ldproxy
  ];
}
