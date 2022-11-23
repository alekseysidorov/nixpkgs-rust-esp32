{
  description = "Rust ESP32 development tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: {
    overlays.default = import ./overlay.nix;

  } // flake-utils.lib.eachDefaultSystem
    (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ self.overlays.default ]; };

        rustShell = pkgs.callPackage ./shell.nix { };

      in
      {
        devShells.default = rustShell;
      }
    );
}
