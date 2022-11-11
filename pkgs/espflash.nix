{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "espflash";
  version = "2.0.0-rc.1";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-fF1M9H2PFg5hG+ULdDY5P66uTPaw5HnjnP/Zy3ROh4g=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-F2BmR6oXYJtP2JXpbWHUZzHQdta3WFNDFLILNi+jKc0=";

  meta = with lib; {
    description = "A command-line tool for flashing Espressif devices over serial";
    homepage = "https://github.com/esp-rs/espflash";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
