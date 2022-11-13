{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-espflash";
  version = "1.7.0";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-2+INaxZmj/HTIQ9YjrkzlaRAr1pwFUnZQzWDwuqsrU8=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-7vAlIlA19r8rvd2IjN8lbxUgAVwe/kvho+lmf71axdU=";

  meta = with lib; {
    description = "Cargo subcommand for flashing Espressif devices over serial";
    homepage = "https://github.com/esp-rs/espflash";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
