{...}: {
  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
}
