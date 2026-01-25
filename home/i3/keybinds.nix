{config, ...}: {
  xsession.windowManager.i3.config.keybindings = let
    modifier = "Mod4";
  in {
    "${modifier}+Return" = "exec ${config.xsession.windowManager.i3.config.terminal}";
    "${modifier}+w" = "kill";
    "${modifier}+f" = "exec ${config.xsession.windowManager.i3.config.menu}";
    "${modifier}+b" = "exec brave";
    "${modifier}+x" = "exec --no-startup-id scrot  ~/Pictures/Screenshots/i3shot_%Y%m%d_%H%M%S.png && notify-send 'Screenshot saved'";

    # Focus
    "${modifier}+a" = "focus left";
    "${modifier}+s" = "focus down";
    "${modifier}+g" = "focus up";
    "${modifier}+d" = "focus right";
    "${modifier}+Left" = "focus left";
    "${modifier}+Down" = "focus down";
    "${modifier}+Up" = "focus up";
    "${modifier}+Right" = "focus right";

    # Move windows
    "${modifier}+Shift+a" = "move left";
    "${modifier}+Shift+s" = "move down";
    "${modifier}+Shift+w" = "move up";
    "${modifier}+Shift+d" = "move right";

    # Split containers
    "${modifier}+h" = "split h";
    "${modifier}+v" = "split v";

    # Fullscreen
    "${modifier}+t" = "fullscreen toggle";

    # Container layout
    "${modifier}+p" = "layout stacking";
    "${modifier}+q" = "layout tabbed";
    "${modifier}+e" = "layout toggle split";

    # Floating
    "${modifier}+o" = "floating toggle";
    "${modifier}+space" = "focus mode_toggle";

    # Focus parent/child
    "${modifier}+Shift+space" = "focus parent";

    # Scratchpad
    "${modifier}+Shift+minus" = "move scratchpad";
    "${modifier}+minus" = "scratchpad show";

    # Workspaces
    "${modifier}+1" = "workspace number 1";
    "${modifier}+2" = "workspace number 2";
    "${modifier}+3" = "workspace number 3";
    "${modifier}+4" = "workspace number 4";
    "${modifier}+5" = "workspace number 5";
    "${modifier}+6" = "workspace number 6";
    "${modifier}+7" = "workspace number 7";
    "${modifier}+8" = "workspace number 8";
    "${modifier}+9" = "workspace number 9";
    "${modifier}+0" = "workspace number 10";

    # Move to workspace
    "${modifier}+Shift+1" = "move container to workspace number 1";
    "${modifier}+Shift+2" = "move container to workspace number 2";
    "${modifier}+Shift+3" = "move container to workspace number 3";
    "${modifier}+Shift+4" = "move container to workspace number 4";
    "${modifier}+Shift+5" = "move container to workspace number 5";
    "${modifier}+Shift+6" = "move container to workspace number 6";
    "${modifier}+Shift+7" = "move container to workspace number 7";
    "${modifier}+Shift+8" = "move container to workspace number 8";
    "${modifier}+Shift+9" = "move container to workspace number 9";
    "${modifier}+Shift+0" = "move container to workspace number 10";

    # Reload/restart
    "${modifier}+Shift+c" = "reload";
    "${modifier}+Shift+r" = "restart";

    # System controls
    "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";
    "${modifier}+Ctrl+l" = "exec i3lock -c 000000";

    # Resize mode
    "${modifier}+r" = "mode resize";
  };

  xsession.windowManager.i3.config.modes = {
    resize = let
      modifier = "Mod4";
    in {
      "j" = "resize shrink width 10 px or 10 ppt";
      "k" = "resize grow height 10 px or 10 ppt";
      "l" = "resize shrink height 10 px or 10 ppt";
      "semicolon" = "resize grow width 10 px or 10 ppt";
      "Left" = "resize shrink width 10 px or 10 ppt";
      "Down" = "resize grow height 10 px or 10 ppt";
      "Up" = "resize shrink height 10 px or 10 ppt";
      "Right" = "resize grow width 10 px or 10 ppt";
      "Return" = "mode default";
      "Escape" = "mode default";
      "${modifier}+r" = "mode default";
    };
  };
}
