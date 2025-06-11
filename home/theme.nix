{
  pkgs,
  pkgs-stable,
  ...
}: {
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "WhiteSur-cursors";
    package = pkgs-stable.whitesur-cursors;
    size = 32;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {color-scheme = "prefer-dark";};
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = "WhiteSur";
      package = pkgs-stable.whitesur-icon-theme;
    };

    theme = {
      name = "WhiteSur";
      package = pkgs.fetchFromGitHub {
        owner = "vinceliuice";
        repo = "WhiteSur-gtk-theme";
        rev = "master";
        hash = "sha256-ANBtC/+MhHS//HGNjRpUarSOt857MnBYofD3xOp4XPE=";
      };
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
}
