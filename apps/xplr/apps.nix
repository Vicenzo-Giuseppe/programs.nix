{
  inputs,
  cell,
}: let
  pkgs = inputs.nixpkgs;
in {
  default = import ./config.nix {inherit pkgs;};
}
