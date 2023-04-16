final: prev:
{
  cargo-espflash = prev.callPackage ./pkgs/cargo-espflash.nix { };
  espflash = prev.callPackage ./pkgs/espflash.nix { };
  ldproxy = prev.callPackage ./pkgs/ldproxy.nix { };
  espup = prev.callPackage ./pkgs/espup.nix { };
}
