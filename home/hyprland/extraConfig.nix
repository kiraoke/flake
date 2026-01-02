{...}
: let
  config = ''
    monitor= eDP-1 ,2560x1600@165,auto,1.33
    monitor= eDP-2 ,2560x1600@165,auto,1.33
    monitor = , preferred, auto, 1, mirror, eDP-2

    windowrule {
      name = windowrule-1
      opacity = 1.0 override 0.85 override
      match:class = zen-beta
    }

    windowrule {
      name = windowrule-2
      opacity = 1.0 override 0.85 override
      match:class = zen-twilight
    }

    windowrule {
      name = windowrule-3
      opacity = 1.0 override 0.85 override
      match:class = zen
    }

    windowrule {
      name = windowrule-4
      size = 800 600
      match:class = zen
      match:title = Save Image
    }

    windowrule {
      name = windowrule-5
      opacity = 1.0 override 0.85 override
      match:class = brave-browser
    }

    windowrule {
      name = windowrule-6
      opacity = 1.0 override 0.85 override
      match:class = org.telegram.desktop
    }

    windowrule {
      name = windowrule-7
      opacity = 1.0 override 0.85 override
      match:class = org.nicotine_plus.Nicotine
    }

    windowrule {
      name = windowrule-8
      opacity = 0.9 override 0.8 override
      match:class = kitty
    }

    windowrule {
      name = windowrule-9
      opacity = 0.9 override 0.8 override
      match:class = com.mitchellh.ghostty
    }

    windowrule {
      name = windowrule-10
      opacity = 0.9 override 0.85 override
      match:class = webstorm
    }

    windowrule {
      name = windowrule-11
      opacity = 1.0 override 1.0 override
      match:title = Spotify
    }

    windowrule {
      name = windowrule-12
      opacity = 1.0 override 1.0 override
      match:class = io.github.celluloid_player.Celluloid
    }

    windowrule {
      name = windowrule-13
      opacity = 1.0 override 1.0 override
      match:class = io.bassi.Amberol
    }

    windowrule {
      name = windowrule-14
      opacity = 1.0 override 0.8 override
      match:class = vesktop
    }

    windowrule {
      name = windowrule-15
      opacity = 1.0 override 0.95 override
      match:class = evince
    }

    windowrule {
      name = windowrule-16
      opacity = 0.95 override 0.85 override
      match:class = nautilus
    }


    windowrule {
      name = windowrule-17
      opacity = 0.85 override 0.8 override
      match:title = ^(kew.*)$
    }

    windowrule {
      name = windowrule-18
      opacity = 1.0 override 0.85 override
      match:class = yaak-app
    }

    windowrule {
      name = windowrule-19
      opacity = 1.0 override 0.85 override
      match:class = jetbrains-studio
    }

    windowrule {
      name = windowrule-20
      opacity = 1.0 override 0.85 override
      match:class = jetbrains-rustrover
    }

    windowrule {
      name = windowrule-21
      opacity = 1.0 override 0.85 override
      match:class = Anki
    }

    windowrule {
      name = windowrule-22
      opacity = 1.0 override 0.85 override
      match:class = org.qbittorrent.qBittorrent
    }

    windowrule {
      name = windowrule-23
      opacity = 1.0 override 0.85 override
      match:class = Ryujinx
    }

    windowrule {
      name = windowrule-24
      opacity = 1.0 override 0.85 override
      match:class = .virt-manager-wrapped
    }

    layerrule {
      name = layerrule-1
      blur = on
      match:namespace = swaync-control-center
    }

    layerrule {
      name = layerrule-2
      blur = on
      match:namespace = swaync-notification-window
    }

    gesture = 3, horizontal, workspace
  '';
in {
  wayland.windowManager.hyprland.extraConfig = config;
}
