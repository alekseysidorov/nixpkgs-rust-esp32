{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "espflash";
  version = "1.7.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-R0vVz2PkcyV7ROCm9xyp9wHSirPtDv6Ga7Vamrvyrjs=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-F9L45EuZwyLJ4q4k6ZhPUI7M5zITOuqwkjuOdtpD4Vc=";

  # Failed to get partition table
  doCheck = false;

  meta = with lib; {
    description = "A command-line tool for flashing Espressif devices over serial";
    homepage = "https://github.com/esp-rs/espflash";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
