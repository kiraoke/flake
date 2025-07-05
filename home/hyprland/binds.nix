{...}: {
  wayland.windowManager.hyprland.settings."$mod" = "SUPER";
  wayland.windowManager.hyprland.settings."$shiftMod" = "SUPER_SHIFT";

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, Return, exec, $terminal"
    "$mod, W, killactive"
    "$mod, M, exit"
    "$mod, E, exec, $fileManager"
    "$mod, V, togglefloating"
    "$mod, F, exec, $menu"
    "$mod, P, pseudo" # dwindle
    "$mod, Space, togglesplit"
    "$mod, B, exec, $browser"
    "$mod, N, exec, $nbrowser"
    "$mod, C, exec, ~/.config/rofi/assets/wifimenu --rofi -s"
    "$shiftMod, right, resizeactive, 100 0"
    "$shiftMod, left, resizeactive, -100 0"
    "$shiftMod, down, resizeactive, 0 100"
    "$shiftMod, up, resizeactive, 0 -100"
    "$mod, L, exec, pkill waybar || waybar"
    "$mod, T, fullscreen, 1"
    "$mod, Y, fullscreen, 0"
    "$mod, S, exec, hyprshot -m output"

    # move windows
    "$shiftMod, A, movewindow, l"
    "$shiftMod, D, movewindow, r"
    "$shiftMod, W, movewindow, u"
    "$shiftMod, S, movewindow, d"

    # move focus of windows
    "$mod, left, movefocus, l"
    "$mod, right, movefocus, r"
    "$mod, up, movefocus, u"
    "$mod, down, movefocus, d"

    # alt tab
    "ALT, Tab, cyclenext"
    "ALT, Tab, bringactivetotop"

    # switch workspaces
    "$mod, 1, workspace, 1"
    "$mod, 2, workspace, 2"
    "$mod, 3, workspace, 3"
    "$mod, 4, workspace, 4"
    "$mod, 5, workspace, 5"
    "$mod, 6, workspace, 6"
    "$mod, 7, workspace, 7"
    "$mod, 8, workspace, 8"
    "$mod, 9, workspace, 9"
    "$mod, 0, workspace, 10"

    # move active window to workspace
    "$shiftMod, 1, movetoworkspace, 1"
    "$shiftMod, 2, movetoworkspace, 2"
    "$shiftMod, 3, movetoworkspace, 3"
    "$shiftMod, 4, movetoworkspace, 4"
    "$shiftMod, 5, movetoworkspace, 5"
    "$shiftMod, 6, movetoworkspace, 6"
    "$shiftMod, 7, movetoworkspace, 7"
    "$shiftMod, 8, movetoworkspace, 8"
    "$shiftMod, 9, movetoworkspace, 9"
    "$shiftMod, 0, movetoworkspace, 0"
  ];

  wayland.windowManager.hyprland.settings.bindm = ["$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow"];
}
