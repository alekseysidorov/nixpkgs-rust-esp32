{
  description = "Rust ESP32 development tools";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: {
    overlay = import ./overlay.nix;
  } // flake-utils.lib.eachDefaultSystem
    (system:
      let pkgs = import nixpkgs { inherit system; overlays = [ self.overlay ]; };
      in
      {
        devShells.default = import ./shell.nix { inherit pkgs; };
      }
    );
}
