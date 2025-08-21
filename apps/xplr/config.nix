{pkgs, ...}: let
  config = pkgs.fetchgit {
    url = "https://github.com/Vicenzo-Giuseppe/wezterm";
    sha256 = "sha256-9N/Ro48DadSyblBTyqTl67PB/kJnAV3HHVp7+DHBqPU=";
  };
in
  with pkgs; runCommand xplr {}
