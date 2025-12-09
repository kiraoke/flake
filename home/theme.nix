{pkgs-stable, ...}: {
  stylix.targets = {
    hyprland.enable = false;
    hyprlock.enable = false;
    neovim.enable = false;
    nixvim.enable = false;
    kitty.enable = false;
    fzf.enable = false;
    dunst.enable = false;
    i3.enable = false;
    feh.enable = false;
    zen-browser.enable = false;
    gdu.enable = false;
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
