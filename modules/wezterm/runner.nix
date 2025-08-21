{
  inputs,
  cell,
}: let
  pkgs = inputs.nixpkgs;
  config = pkgs.fetchgit {
    url = "https://github.com/Vicenzo-Giuseppe/wezterm";
    sha256 = "sha256-TIGlLbCW2VHnC3EncKC/D5sOSnfF5jiB5TnO3c7uSMI=";
  };
in {
  wezterm = pkgs.writeShellScriptBin "wezterm" ''
    export WEZTERM_CONFIG_FILE="${config}/wezterm.lua"
    exec "${pkgs.wezterm}/bin/wezterm" --config-file "${config}/wezterm.lua" "$@"
  '';
}
