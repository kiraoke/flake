{...}: {
  wayland.windowManager.hyprland.settings.dwindle = {
    pseudotile = true;
    preserve_split = true;
  };

  wayland.windowManager.hyprland.settings.master = {new_status = "master";};

  wayland.windowManager.hyprland.settings.misc = {
    force_default_wallpaper = -1;
    disable_hyprland_logo = true;
  };

  wayland.windowManager.hyprland.settings.input = {
    kb_layout = "us";
    kb_variant = "";

    follow_mouse = 1;

    sensitivity = 0;

    touchpad = {natural_scroll = true;};
  };

  wayland.windowManager.hyprland.settings.gestures = {workspace_swipe = true;};
}
