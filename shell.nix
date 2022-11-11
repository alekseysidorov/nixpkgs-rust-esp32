# Temporary shell file to check packages

{ pkgs ? import ./default.nix }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust support
    cargo-espflash
    ldproxy
    espup

    # Tools required to use ESP-IDF.
    git
    wget
    gnumake

    flex
    bison
    gperf
    pkgconfig

    cmake
    ninja

    ncurses5
  ] ++ lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];
}
