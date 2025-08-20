{
  pkgs,
  ...
}: let
config = pkgs.fetchgit {
      url = "https://github.com/Vicenzo-Giuseppe/wezterm";
      sha256 = "sha256-9N/Ro48DadSyblBTyqTl67PB/kJnAV3HHVp7+DHBqPU=";
    };
in
  with pkgs; runCommand wezterm.meta.mainProgram {
    nativeBuildInputs = with pkgs; [makeWrapper];
  } ''
    # Criar o diretório de configuração
    mkdir -p $out/etc/xdg/wezterm

    # Escrever o arquivo de configuração personalizado
    cp -r ${config}/* $out/etc/xdg/wezterm
    # Criar o wrapper para o Wezterm
    mkdir -p $out/bin
    makeWrapper ${wezterm}/bin/wezterm $out/bin/wezterm \
      --add-flags "--config-file $out/etc/xdg/wezterm/wezterm.lua" \
      --set WEZTERM_CONFIG_FILE $out/etc/xdg/wezterm/wezterm.lua  \
      --set WEZTERM_DISABLE_SAFE_MODE 1

    # Link simbólico para o diretório de configuração no sistema
    ln -s $out/etc/xdg/wezterm $out/etc/xdg/wezterm
  ''
