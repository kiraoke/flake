{config, pkgs, inputs, ...}: {
  home.username = "aqua";
  home.homeDirectory = "/home/aqua";

  home.packages = with pkgs; [
    # trash tool
    vscode

    # cool tool
    fastfetch

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    which
    file
    tree

    # file managers
    yazi
    nautilus

    btop
    htop
  ];
  
  programs.floorp = {
	enable = true;
  };

  programs.git = {
    userName = "ingineous";
    userEmail = "ingineousus@gmail.com";
  };

  home.stateVersion = "24.05";

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER_SHIFT";

      "$terminal" = "kitty";
      "$browser" = "floorp";
      "$fileManager" = "nautilus";
      "$TFileManager" = "$terminal -e yazi";

      # ------------------------------------
      # Environment variables
      # ------------------------------------

      env = [
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
      ];

      # ------------------------------------------
      # Startup
      # ------------------------------------------

      exec-once = [
         "waybar"
      ];

      # ------------------------------------------
      # Monitors
      # ------------------------------------------

      monitor = [
         "eDP-1, 2560x1600@165, auto, 1.33"
	 " , preferred, auto, 1, mirror, eDP-1"
      ];

      xwayland = {
	  force_zero_scaling = true;
      };

      # --------------------------------------------
      # Keybinds
      # --------------------------------------------
      bind = [
        "$mod, Return, exec, $terminal"
	"$mod, M, exit"
      ];
    };
  };

  programs.home-manager.enable = true;
}
