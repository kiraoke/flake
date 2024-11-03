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

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
