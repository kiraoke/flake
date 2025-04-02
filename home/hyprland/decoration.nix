{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;

    active_opacity = 0.80;
    inactive_opacity = 0.75;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 10;
      passes = 2;
      new_optimizations = true;
      ignore_opacity = true;
      noise = 0;
      contrast = 1.8;
      vibrancy = 0.2;
      vibrancy_darkness = 0.2;
      brightness = 0.4;
    };
  };
}
