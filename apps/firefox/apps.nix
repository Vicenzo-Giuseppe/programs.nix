{
  inputs,
  cell,
}: let
  pkgs = inputs.nixpkgs;
in {
  default = with pkgs; wrapFirefox firefox-esr-128-unwrapped (import ./config.nix {inherit pkgs;});
}
