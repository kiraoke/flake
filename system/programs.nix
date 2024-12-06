{...}: {
  # Set the default editor to nvim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}
