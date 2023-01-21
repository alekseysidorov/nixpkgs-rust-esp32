# Shell example

{ pkgs ? import ./default.nix }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust support
    cargo-espflash
    espflash
    ldproxy
    espup
  ] ++ lib.optionals stdenv.isDarwin [
    libiconv
    darwin.apple_sdk.frameworks.Security
  ];

  shellHook = ''
    # Fix "riscv32-esp-elf-gcc: error: unrecognized command line option '--target=riscv32imc-esp-espidf'"
    unset CC; unset CXX
    
    echo "Welcome to the Rust esp32-idf developer environment"
  '';
}
