{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;

    active_opacity = 0.85;
    inactive_opacity = 0.8;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 8;
      passes = 2;
      new_optimizations = true;
      ignore_opacity = true;
      noise = 0.01;
      vibrancy = 0.4;
      vibrancy_darkness = 0.1;
      brightness = 0.7;
    };
  };
}
