{ lib, fetchCrate, rustPlatform }:

rustPlatform.buildRustPackage rec {
  pname = "ldproxy";
  version = "0.3.2";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-NWOtuhII0r2h8cHtTrDV2edyCkd8BkDXrwbb2jGxERo=";
  };


  cargoSha256 = "sha256-ZwD+8rOP+ishRHmk7AIM8Nm8/5vL270CMD75ic5fxhE=";

  meta = with lib; {
    description = "A linker proxy tool";
    homepage = "https://github.com/esp-rs/embuild";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
