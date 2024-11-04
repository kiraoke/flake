{config, pkgs,lib , inputs, ...}: {
  home.username = "aqua";
  home.homeDirectory = "/home/aqua";

#  xdg.fontconfig.enable = true;

  home.packages = with pkgs; [
    qt6ct
    qt6.qtwayland
    nerdfonts
    noto-fonts
    fira-code

    xdg-desktop-portal-hyprland

    # trash tool
    vscode

    # cool tool
    fastfetch
    cava
    pipes-rs

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

    light
    pywal
  ];

  fonts.fontconfig = {
     enable = true;
     defaultFonts = {
        monospace = ["Firacode"];
	sansSerif = ["NotoSans"];
	serif = ["NotoSerif"];
     };
  };
  
  programs.floorp = {
	enable = true;
  };

  programs.git = {
    userName = "ingineous";
    userEmail = "ingineousus@gmail.com";
  };

  home.stateVersion = "24.05";

  programs.kitty = {
      enable = true;
      extraConfig = ''
	font_family NotoSans
	italic_font auto
	bold_font auto
	bold_italic_font auto
	font_size 11.5

	include ~/.cache/wal/colors-kitty.conf

        # -- window --
	window_margin_width 10 15
	window_resize_step_cells 5
	window_resize_step_lines 2
	confirm_os_window_close 0

	# -- misc settings --
	enable_audio_bell no
	force_ltr no
	detect_urls yes

	# -- map keys --
	map f1 launch --cwd=current
	map f2 launch --cwd=current --type=tab
      '';
  };

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER SHIFT";

      "$terminal" = "kitty";
      "$browser" = "floorp";
      "$fileManager" = "nautilus";
      "$menu" = "wofi --show drun --allow-images";
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

	 "XCURSOR_SIZE, 24"
	 "HYPRCURSOR_SIZE, 24"
	 "QT_QPA_PLATFORMTHEME.qt6ct"
      ];

      # ------------------------------------------
      # Startup
      # ------------------------------------------

      exec-once = [
         "waybar"
		 "hypridle"
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

      windowrule = [
        "opacity 1.0 override 0.85 override, class:zen"
        "opacity 0.9 override 0.85 class:webstorm"
	"opacity 1.0 override 1.0 override title:^(Spotify)$"
	"opacity 1.0 override 0.6 override, class:vesktop"
	"size 800 600, class:zen-browser, title:Save Image"
	"suppressevent maximize, class:.*"
      ];
      
      # --------------------------------------------
      # Keybinds
      # --------------------------------------------

      bind = [
        "$mod, Return, exec, $terminal"
	"$mod, W, killactive"
	"$mod, M, exit"
	"$mod, E, exec, $fileManager"
	"$mod, V, togglefloating"
	"$mod, F, exec, $menu"
	"$mod, P, pseudo" # dwindle
	"$mod, Space, togglesplit"
	"$mod, B, exec, $browser"
	"$shiftMod, right, resizeactive, 100 0"
	"$shiftMod, left, resizeactive, -100 0"
	"$shiftMod, down, resizeactive, 0 100"
	"$shiftMod, up, resizeactive, 0 -100"
	"$mod, L, exec, killall waybar || waybar"
	"$mod, T, fullscreen, 1"
	"$mod, Y, fullscreen, 0"

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
	"$mod, 1, movetoworkspace, 1"
	"$mod, 2, movetoworkspace, 2"
	"$mod, 3, movetoworkspace, 3"
	"$mod, 4, movetoworkspace, 4"
	"$mod, 5, movetoworkspace, 5"
	"$mod, 6, movetoworkspace, 6"
	"$mod, 7, movetoworkspace, 7"
	"$mod, 8, movetoworkspace, 8"
	"$mod, 9, movetoworkspace, 9"
	"$mod, 0, movetoworkspace, 0"
      ];

      # move and resize windows while pressing SUPER	
      bindm = [
	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

      general = {
        gaps_in = 3.5;
	gaps_out = 6;
	border_size = 3;

	"col.active_border" = "white rgba(59595900) grey 180deg";
	"col.inactive_border" = "rgba(59595900)";

	resize_on_border = true;
	allow_tearing = true;

	layout = "dwindle";
      };

      decoration = {
         rounding = 10;

	 active_opacity = 0.85;
	 inactive_opacity = 0.6;
	 fullscreen_opacity = 1.0;

	 blur = {
	    enabled = true;
	    size = 10;
	    passes = 2;
	    new_optimizations = true;
	    ignore_opacity = true;
	    noise = 0.08;
	    vibrancy_darkness = 0.1;
	    brightness = 0.50;
	 };
      };

      # animations
      animations = {
	 enabled = true;
	 bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

	 animation = [
	 "windows, 1, 7, myBezier"
	 "windowsOut, 1, 7, default, popin 80%"
	 "border, 1, 10, default"
	 "borderangle, 1, 8, default"
	 "fade, 1, 7, default"
	 "workspaces, 1, 6, default"
	 ];
      };

      dwindle = {
	 pseudotile = true;
	 preserve_split = true;
      };

      master = {
        new_status = "master";
      };

      misc = {
	force_default_wallpaper = -1;
	disable_hyprland_logo = true;
      };

      input = {
	kb_layout = "us";
	kb_variant = "";

	follow_mouse = 1;

	sensitivity = 0;

	touchpad = {
	   natural_scroll = true;
	};
      };

      gestures = {
	workspace_swipe = true;
      };
    };
  };


  services.hypridle = {
      enable = true;

      settings = {
	general = {
	   lock_cmd = "pidof hyprlock || hyprlock";
	   before_sleep_cmd = "playerctl pause ; hyprlock";
	   ignore_dbus_inhibit = false;
	};

	listener = [
	   {
	      timeout = 1000;
	      on-timeout = "loginctl lock-session";
	   }

	   {
	      timeout = 995;
	      on-timeout = "light -S 5";
	      on-resume = "light -S 20";
	   }
	];
      };
  };

  services.hyprpaper = {
	enable = true;
	settings = {
		ipc = "off";
		splash = false;
		preload = ["/home/aqua/Pictures/wallpapers/upaqua.png"];
		wallpaper = [", /home/aqua/Pictures/wallpapers/upaqua.png"];
	};
  };

  # ------------------------------------------
  # Hyprlock
  # ------------------------------------------
  programs.hyprlock = {
     enable = true;
     
	 settings = {
		 background = [
     {
        monitor = "";
	path = "~/Pictures/wallpapers/marima.jpg";
	color = "rgba(25, 20, 20, 1.0)";

	blur_passes = 0;
	blur_size = 2;
	noise = 0;
	contrast = 0;
	brightness = 0;
	vibrancy = 0;
	vibrancy_darkness = "0.0";
     }
     ];

     input-field = [
	{
	   monitor = "";
	   size = "400, 80";
	   outline_thickness = 2;
	   dots_size = 0.25;
	   dots_spacing = 0.55;
	   dots_center = true;
	   dots_rounding = -1;
	   outer_color = "rgb(236, 169, 158)";
	   inner_color = "rgb(135, 27, 43)";
	   font_color = "rgb(179, 206, 208)";
	   fade_on_empty = false;
	   placeholder_text = "";
	   hide_input = false;
	   check_color = "rgba(204, 136, 34, 0)";
	   fail_color = "rgba(204, 34, 34, 0)";
	   fail_text = "$FAIL <b>($ATTEMPTS)</b>";
	   fail_transition = 300;
	   capslock_color = -1;
	   numlock_color = -1;
	   bothlock_color = -1;
	   invert_numlock = false;
	   swap_font_color = false;
	   position = "0, -270";
	   halign = "center";
	   valign = "center";
	}
      ];

      label = [
        {
	   monitor = "";
	   text = ''cmd[update:1000] echo "$(data + "%A, %B %d")"'';
	   color = "rgba(215, 130, 147, 0.75)";
	   font_size = 80;
	   font_family = "SF Pro Display Bold";
	   position = "0, 400";
	   halign = "center";
	   valign = "center";
	 }

	 {
	   monitor = "";
	   text = ''cmd[update:1000] echo "$(date +"%k:%M")"'';
	   color = "rgba(179, 206, 208, 0.75)";
	   font_size = 140;
	   font_family = "SF Pro Display Bold";
	   position = "0, 253";
	   halign = "center";
	   valign = "center";
	 }

	 {
	   monitor = "";
	   text = "Touch Id or Enter Password";
	   color = "rgba(242, 243, 244, 0.75)";
	   font_size = 10;
	   font_family = "SD Pro Display";
	   position = "0, -242";
	   halign = "center";
	   valign = "center";
	 }
     ];
	 };
  };

  programs.pywal = {
	enable = true;
  };

  programs.home-manager.enable = true;
}
