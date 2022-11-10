{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "espup";
  version = "0.2.1";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-X5yEbZXDgs7cNV3hnMzdCeMeLmzpoMuk0+tKv1qqDFk=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-IKeHnSrFiB+T3FiFkeK7vQUbbOHZzsfZHCjBZuOGU8Y=";

  meta = with lib; {
    description = "A linker proxy tool";
    homepage = "https://github.com/esp-rs/espup";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
