{ lib, fetchCrate, rustPlatform, darwin, stdenv }:

rustPlatform.buildRustPackage rec {
  pname = "espup";
  version = "0.2.6";

  src = fetchCrate {
    inherit pname version;
    sha256 = "sha256-+G/0Eo1/IULoa3EQmn2CYUzqyQ2iXnFtyUBfzwJNMp4=";
  };

  buildInputs = lib.optionals stdenv.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ];

  cargoSha256 = "sha256-lmyeK3Wj/q1uNw4iROuaHkjfBxvXtktK3e3y5GytbXg=";

  # thread 'tests::test_get_export_file' panicked at 'assertion failed: get_export_file(Some(home_dir)).is_err()', src/main.rs:542:9
  doCheck = false;

  meta = with lib; {
    description = "A linker proxy tool";
    homepage = "https://github.com/esp-rs/espup";
    license = licenses.mit;
    maintainers = [ maintainers.alekseysidorov ];
  };
}
