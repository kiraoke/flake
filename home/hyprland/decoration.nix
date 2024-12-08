{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;

    active_opacity = 0.85;
    inactive_opacity = 0.8;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 10;
      passes = 2;
      new_optimizations = true;
      ignore_opacity = true;
      noise = 8.0e-2;
      vibrancy_darkness = 0.1;
      brightness = 0.5;
    };
  };
}
