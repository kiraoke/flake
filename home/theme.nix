{pkgs, pkgs-stable, ...}: {
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
      name = "rose-pine-dark";
      package = pkgs-stable.rose-pine-gtk-theme;
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
