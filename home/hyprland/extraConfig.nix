{...}: {
  wayland.windowManager.hyprland.extraConfig = ''
    monitor= eDP-1 ,2560x1600@165,auto,1.33
    monitor= eDP-2 ,2560x1600@165,auto,1.33
    monitor = , preferred, auto, 1, mirror, eDP-2

    windowrulev2 = opacity 1.0 override 0.85 override, class:zen-beta
    windowrulev2 = opacity 1.0 override 0.85 override, class:org.telegram.desktop
    windowrulev2 = opacity 1.0 override 0.85 override, class:org.nicotine_plus.Nicotine
    windowrulev2 = opacity 1.0 override 0.85 override, class:zen
    windowrulev2 = opacity 0.9 override 0.8 override, class:kitty
    windowrulev2 = opacity 0.65 override 0.63 override, class:com.mitchellh.ghostty
    windowrulev2 = opacity 0.9 override 0.85 override, class:webstorm
    windowrulev2 = opacity 1.0 override 1.0 override, title:Spotify
    windowrulev2 = opacity 1.0 override 1.0 override, class:io.github.celluloid_player.Celluloid
    windowrulev2 = opacity 1.0 override 1.0 override, class:io.bassi.Amberol
    windowrulev2 = opacity 1.0 override 0.8 override, class:vesktop
    windowrulev2 = opacity 1.0 override 0.95 override, class:evince
    windowrulev2 = opacity 0.95 override 0.85 override, class:nautilus
    windowrulev2 = size 800 600, class:zen-browser,title:Save Image

    windowrulev2 = opacity 0.85 override 0.8 override, title:^(kew.*)$


    layerrule = blur, swaync-control-center
    layerrule = blur, swaync-notification-window
  '';
}
