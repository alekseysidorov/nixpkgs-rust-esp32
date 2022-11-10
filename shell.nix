# Temporary shell file to check packages

{ pkgs ? import <nixpkgs> { } }:
let
  # overlay packages
  cargo-espflash = pkgs.callPackage ./pkgs/cargo-espflash.nix { };
  ldproxy = pkgs.callPackage ./pkgs/ldproxy.nix { };
  espup = pkgs.callPackage ./pkgs/espup.nix { };

  lib = pkgs.lib;
  stdenv = pkgs.stdenv;
  darwin = pkgs.darwin;
in
pkgs.mkShell {
  # nativeBuildInputs is usually what you want -- tools you need to run
  nativeBuildInputs = [
    pkgs.libiconv
    pkgs.rustup
    pkgs.cargo-generate
    pkgs.cmake
    pkgs.ninja

    cargo-espflash
    ldproxy
    espup
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];
}
