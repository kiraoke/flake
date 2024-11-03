{config, pkgs, inputs, ...}: {
  home.username = "aqua";
  home.homeDirectory = "/home/aqua";

  home.packages = with pkgs; [
    # cool tool
    fastfetch

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    which
    file
    tree

    btop
    htop
  ];
  
  programs.floorp = {
	enable = true;
  };

  programs.git = {
    userName = "ingineous";
    userEmail = "ingineousus@gmail.com";
  };

  home.stateVersion = "24.05";

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
  };

  programs.home-manager.enable = true;
}
