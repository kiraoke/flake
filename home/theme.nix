{pkgs-stable, ...}: {
  stylix.targets = {
    hyprland.enable = false;
    hyprlock.enable = false;
    neovim.enable = false;
    nixvim.enable = false;
    fzf.enable = false;
    bat.enable = false;
    kitty.enable = false;
  };

  home.file.".local/share/fonts/DIN" = {
    source = ../assets/DIN;
    recursive = true;
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "WhiteSur";
      package = pkgs-stable.whitesur-icon-theme;
    };
  };
}
