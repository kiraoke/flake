{...}: {
  wayland.windowManager.hyprland.settings.decoration = {
    rounding = 10;

    active_opacity = 0.90;
    inactive_opacity = 0.85;
    fullscreen_opacity = 1.0;

    blur = {
      enabled = true;
      size = 8;
      passes = 2;
      new_optimizations = true;
      ignore_opacity = true;
      noise = 0.05;
      contrast = 3;
      vibrancy = 0.4;
      vibrancy_darkness = 0.4;
      brightness = 0.6;
    };
  };
}
