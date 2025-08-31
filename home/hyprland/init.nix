{
  pkgs,
  userpath,
  ...
}: {
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
      "HYPRSHOT_DIR, ${userpath}/Pictures/ss"
      "GTK_IM_MODULE, fcitx"
      "QT_IM_MODULE, fcitx"
      "XMODIFIERS, @im=fcitx"
      "MOZ_DISABLE_RDD_SANDBOX, 1"
      "LIBVA_DRIVER_NAME, nvidia"
    ];

    settings.xwayland = {force_zero_scaling = true;};

    settings.exec-once = [
      "waybar"
      "hypridle"
      "nm-applet"
      "swaync"
      # "easyeffects --gapplication-service"
      "swww-daemon"
      "swww img ~/flake/assets/wallpapers/name.jpg"
      "fcitx5"
    ];

    settings."$terminal" = "kitty";
    settings."$browser" = "zen";
    settings."$nbrowser" = "nvidia-offload zen || zen";
    settings."$fileManager" = "nautilus";
    settings."$menu" = "rofi -show drun";
    settings."$clip" = "~/flake/dots/fuzzel/clipboard-fuzzel.sh";
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
    ./misc.nix
    ./waybar.nix
  ];
}
