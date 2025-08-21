{pkgs, ...}: let
  config = pkgs.fetchgit {
    url = "https://github.com/Vicenzo-Giuseppe/wezterm";
    sha256 = "sha256-TIGlLbCW2VHnC3EncKC/D5sOSnfF5jiB5TnO3c7uSMI=";
 };
in
  with pkgs;
    runCommand wezterm.meta.mainProgram {
      nativeBuildInputs = with pkgs; [makeWrapper];
    } ''
      mkdir -p $out

      cp -r ${config}/* $out

      mkdir -p $out/bin
      makeWrapper ${wezterm}/bin/wezterm $out/bin/wezterm \
        --add-flags "--config-file $out/wezterm.lua" \
        --set WEZTERM_CONFIG_FILE $out/wezterm.lua
    ''
