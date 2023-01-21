{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "espflash";
  version = "2.0.0-rc.3";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-Aye2vsIVW96DvsJfz0Gt0zhY+zkb2pc30V6jIwRWANo=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-GWvBRGNvlk68DJFqdqD2VMgLDo8pgKoMAqN+cB6fvjY=";

  # Failed to get partition table
  doCheck = false;

  meta = with lib; {
    description = "A command-line tool for flashing Espressif devices over serial";
    homepage = "https://github.com/esp-rs/espflash";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
