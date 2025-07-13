{
  userpath,
  pkgs,
  ...
}: {
  imports = [
    ./colors.nix
    ./keybinds.nix
  ];

  services.dunst = {
    enable = true;
    settings = {
      global = {
        geometry = "300x60-20+48";
        transparency = 10;
        frame_color = "#689d6a";
      };
      urgency_normal = {
        background = "#282828";
        foreground = "#ebdbb2";
        timeout = 10;
      };
      urgency_critical = {
        background = "#cc241d";
        foreground = "#ebdbb2";
        timeout = 0;
      };
    };
  };

  services.picom = {
    enable = true;

    # Shadow settings
    shadow = true;
    shadowOffsets = [(-5) (-5)];
    shadowOpacity = 1;

    activeOpacity = 0.90;
    inactiveOpacity = 0.85;

    backend = "glx";
    vSync = true;

    settings = {
      shadow-exclude = [
        "name = 'Notification'"
        "class_g = 'Conky'"
        "class_g ?= 'Notfiy-osd'"
        "_GTK_FRAME_EXTENTS@:c"
      ];

      wintypes = {
        tooltip = {
          fade = true;
          shadow = false;
          focus = true;
        };
        dock = {shadow = false;};
        dnd = {shadow = false;};
      };
    };
  };

  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = "Mod4";
      terminal = "kitty";
      gaps = {
        inner = 10;
        outer = 5;
      };

      window = {
        titlebar = true;
        border = 3;
      };

      floating = {
        titlebar = true;
        border = 3;
      };

      # Workspaces
      workspaceLayout = "default";

      startup = [
        {
          command = "nm-applet";
        }
        {
          command = "setxkbmap -option caps:swapescape";
          always = true;
          notification = false;
        }
        {
          command = "blueman-applet";
          always = false;
          notification = false;
        }
        {
          command = "dunst";
          always = false;
          notification = false;
        }
        {
          command = "feh --bg-scale ${userpath}flake/assets/wallpapers/lainer.png";
          always = true;
          notification = false;
        }
      ];

      bars = [
        {
          position = "bottom";
          statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${userpath}flake/dots/i3status-rust.toml";
          fonts = {
            size = 16.0;
          };
          colors = {
            background = "#cba882";
            statusline = "#ebdbb2";
            separator = "#689d6a";
            focusedWorkspace = {
              background = "#6b2c25";
              border = "#6b2c25";
              text = "#ebdbb2";
            };
            activeWorkspace = {
              background = "#3c3836";
              border = "#3c3836";
              text = "#ebdbb2";
            };
            inactiveWorkspace = {
              background = "#cba882";
              border = "#cba882";
              text = "#6b2c25";
            };
            urgentWorkspace = {
              background = "#cc241d";
              border = "#cc241d";
              text = "#ebdbb2";
            };
            bindingMode = {
              background = "#d79921";
              border = "#d79921";
              text = "#282828";
            };
          };
        }
      ];
    };
  };
}
