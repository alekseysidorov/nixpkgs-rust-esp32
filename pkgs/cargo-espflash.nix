{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "cargo-espflash";
  version = "2.0.0-rc.1";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-j9EAMgLYSctQ0PFA7MZ6qn3elyBXW0aql6Q2Owaksw0=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-TpsBvN3KYSmqMaQsBEKUnSoOTbRdlm5JAIiVuwXzq3Q=";

  meta = with lib; {
    description = "Cargo subcommand for flashing Espressif devices over serial";
    homepage = "https://github.com/esp-rs/espflash";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
