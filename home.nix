{config, pkgs, inputs, ...}: {
  home.username = "aqua";
  home.homeDirectory = "/home/aqua";

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}