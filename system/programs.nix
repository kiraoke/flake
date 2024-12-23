{inputs, pkgs, ...}: {
  # Set the default editor to nvim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  };
}
