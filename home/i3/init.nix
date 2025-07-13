{userpath, pkgs, ...}: {
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
          command = "feh --bg-scale ${userpath}flake/assets/wallpapers/laind.png";
          always = true;
          notification = false;
        }
      ];

      # bars = [
      #   {
      #     position = "top";
      #     statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
      #     colors = {
      #       background = "#282828";
      #       statusline = "#ebdbb2";
      #       separator = "#689d6a";
      #       focusedWorkspace = {
      #         background = "#689d6a";
      #         border = "#689d6a";
      #         text = "#282828";
      #       };
      #       activeWorkspace = {
      #         background = "#3c3836";
      #         border = "#3c3836";
      #         text = "#ebdbb2";
      #       };
      #       inactiveWorkspace = {
      #         background = "#282828";
      #         border = "#282828";
      #         text = "#a89984";
      #       };
      #       urgentWorkspace = {
      #         background = "#cc241d";
      #         border = "#cc241d";
      #         text = "#ebdbb2";
      #       };
      #       bindingMode = {
      #         background = "#d79921";
      #         border = "#d79921";
      #         text = "#282828";
      #       };
      #     };
      #   }
      # ];


    };
  };
}
