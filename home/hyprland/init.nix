{pkgs, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings.env = [
      "XDG_SESSION_TYPE, wayland"
      "XDG_CURRENT_DESKTOP, Hyprland"
      "XDG_sESSION_DESKTOP, Hyprland"

      "DISABLE_QT5_COMPAT, 1"
      "QT_QPA_PLATFORM, wayland"
      "QT_AUTO_SCREEN_SCALE_FACTOR, 1"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION, 1"

      "NIXOS_OZONE_WL, 1"
      "ELECTRON_OZONE_PLATFORM_HINT, AUTO"

      "GTK_WAYLAND_DISABLE_WINDOWDECORATION, 1"

      "QT_QPA_PLATFORMTHEME.qt6ct"

      "BRAVE_BROWSER, ${pkgs.brave}"
    ];

    settings.xwayland = {force_zero_scaling = true;};

    settings.exec-once = ["waybar" "hypridle" "nm-applet" "swaync"];

    settings."$terminal" = "kitty";
    settings."$browser" = "zen";
    settings."$fileManager" = "dolphin";
    settings."$menu" = "wofi --show drun --allow-images";
    settings."$TFileManager" = "$terminal -e yazi";
  };

  programs.pywal = {enable = true;};

  imports = [
    ./animations.nix
    ./binds.nix
    ./decoration.nix
    ./extraConfig.nix
    ./general.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./misc.nix
    ./waybar.nix
  ];
}
