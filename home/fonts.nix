{...}: {
  home.file.".local/share/fonts/DIN" = {
    source = ../assets/DIN;
    recursive = true;
  };

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      monospace = ["JetBrains Mono"];
      sansSerif = ["NotoSans" ];
      serif = ["NotoSerif"];
    };
  };
}
