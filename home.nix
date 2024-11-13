{config, pkgs, pkgs-stable,lib,nixvim, inputs, ...}:
{
    programs.nixvim = {
        enable = true;

	colorschemes."rose-pine".enable = true;

	plugins = {
	  treesitter.enable = true;
	  telescope.enable = true;
	  "web-devicons".enable = false;
    cloak.enable = true;

    harpoon.enable = true;
    trouble.enable = true;
    "zen-mode".enable = true;
    fugitive.enable = true;
	};

	extraConfigLua = ''
	 vim.g.mapleader = " "
	 vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- editor settings
vim.opt.nu = true
vim.opt.relativenumber = true

vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=4")

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"


	 vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
	 vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

	 local builtin = require('telescope.builtin')
	 vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	 vim.keymap.set('n', '<C-p>', builtin.git_files, {})
	 vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
	 vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

    -- cloak settings
	  require("cloak").setup({
		enabled = true,
		cloak_character = "*",
		-- The applied highlighting group (colors) on the cloaking
		highlight_group = "Comment",
		patterns = {
			{
			  file_pattern = {
				".env*",
				"wrangled.toml",
				".dev.vars",
			  },
			  cloak_pattern = "=.*",
			},
		},
	  })

	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")

	vim.keymap.set("n", "<leader>a", mark.add_file)
	vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

	vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
	vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end)
	vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end) 
	vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end)
 
   -- trouble settings
        local trouble = require("trouble")
        trouble.setup({
            icons = false,
        })

        vim.keymap.set("n", "<leader>tt", trouble.toggle)
        vim.keymap.set("n", "<leader>tn", function() trouble.next({skip_groups=true, jump=true}) end)
        vim.keymap.set("n", "<leader>tp", function() trouble.previous({skip_groups=true, jump=true}) end)
  -- zen mode settings


  -- fugitive settings
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

        local Ingineous_Fugitive = vim.api.nvim_create_augroup("Ingineous_Fugitive", {})

        local autocmd = vim.api.nvim_create_autocmd
        autocmd("BufWinEnter", {
            group = Ingineous_Fugitive,
            pattern = "*",
            callback = function()
                if vim.bo.ft ~= "fugitive" then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = {buffer = bufnr, remap = false}
                vim.keymap.set("n", "<leader>p", function()
                    vim.cmd.Git('push')
                end, opts)

                -- rebase always
                vim.keymap.set("n", "<leader>P", function()
                    vim.cmd.Git({'pull',  '--rebase'})
                end, opts)

                -- NOTE: It allows me to easily set the branch i am pushing and any tracking
                -- needed if i did not set the branch up correctly
                vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);
            end,
        })


        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
 
	'';
    };

  home.username = "aqua";
  home.homeDirectory = "/home/aqua";

  home.packages = (with pkgs; [
    qt6ct
    qt6.qtwayland
    nerdfonts
    noto-fonts
    pywalfox-native
    xdg-desktop-portal-hyprland
    easyeffects
    lxqt.pavucontrol-qt
    mpv
    brightnessctl
    mpvScripts.uosc

    # trash tool
    vscode
    nautilus

    # cool tool
    fastfetch
    ripgrep
    cava
    bat
    pipes-rs
    brave
    telegram-desktop
    yt-dlp
    ffmpeg
    shotman
    upscayl
    hyprshot
    protonvpn-gui
    qbittorrent
    fast-cli
    audacious

    # archives
    zip
    xz
    unzip
    p7zip

    # misc
    which
    file
    tree
    vlc
    nodejs_22
    pnpm

    # file managers
    yazi

    btop
    htop

    pywal

    networkmanagerapplet

    # lsp
    rust-analyzer
  ]);

  fonts.fontconfig = {
     enable = true;
     defaultFonts = {
        monospace = ["JetBrains Mono"];
	sansSerif = ["NotoSans"];
	serif = ["NotoSerif"];
     };
  };

  home.pointerCursor = {
      gtk.enable = true;
	  x11.enable = true;
	  name = "WhiteSur-cursors";
	  package = pkgs.whitesur-cursors;
	  size = 28;
  };

    #   home.file.".config/nvim" = {
    #    source = /home/aqua/flake/nvim;
    #    recursive = true;
    #};

  gtk = {
    enable = true;

    iconTheme = {
	name = "WhiteSur";
	package = pkgs.whitesur-icon-theme;
    };

    theme = {
      name = "rose-pine";
      package = pkgs.rose-pine-gtk-theme;
    };

     # Force dark theme for GTK3 apps
    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    # Force dark theme for GTK4 apps
    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };
  
  programs.git = {
    enable = true;

    userName = "kiraoke";
    userEmail = "kiraokeku@gmail.com";
  };

  programs.zsh  = {
	enable = true;
	enableCompletion = true;
	autosuggestion.enable = true;
	syntaxHighlighting.enable = true;
	autocd = true;

	history = {
		size = 10000;
		path = "${config.xdg.dataHome}/zsh/history";
		ignoreDups = true;
		share = true;
		extended = true;
	};

	initExtra = ''
	   fastfetch

	   # Enable Powerlevel10k instant prompt
	   if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
	      source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
		fi

		# source the theme
		source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme


		# to customize prompt, run `p10k configure` or edit ~/.p10k.zsh
		[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
	'';

	plugins = [
		{
			name = "powerlevel10k";
			src = pkgs.zsh-powerlevel10k;
			file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
		}
	];

	shellAliases = {
		saymyname = "echo Heisenberg";
		"177013" = "xdg-open https://nhentai.to/g/177013";
		rebuild = "sudo nixos-rebuild switch --flake ~/flake#hoshino --impure";
		wifilogin = "~/bits-login/login.sh";
		 # Basic git commands
      g = "git";
      gs = "git status";
      ga = "git add";
      gaa = "git add --all";
      gc = "git commit -v";
      gcmsg = "git commit -m";
      gp = "git push";
      gpl = "git pull";
      gd = "git diff";
      gco = "git checkout";
      gb = "git branch";
      gl = "git log";
      
      # More advanced aliases
      glog = "git log --oneline --decorate --graph";
      grb = "git rebase";
      grs = "git reset";
      grh = "git reset --hard";
      gcl = "git clone";
      gf = "git fetch";
      gm = "git merge";
	};
  };

  programs.fzf = {
	enable = true;
	enableZshIntegration = true;
  };

  home.stateVersion = "24.05";


  home.file.".p10k.zsh".source = /home/aqua/flake/.p10k.zsh;
  home.file.".config/waybar/colors-waybar.css".source = /home/aqua/flake/colors-waybar.css;

  home.file.".config/wireplumber/wireplumber.conf.d/50-also-config.conf".text = ''
	monitor.alsa.rules = [
  {
    matches = [
      # This matches the value of the 'node.name' property of the node.
      {
        node.name = "~alsa_output.*"
      }
    ]
    actions = {
      # Apply all the desired node specific settings here.
      update-props = {
        api.alsa.period-size   = 1024
        api.alsa.headroom      = 8192
      }
    }
  }
]

  '';

  programs.kitty = {
      enable = true;
      extraConfig = ''
	font_family Noto Nerd Font
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

  programs.btop = {
     enable = true;
     settings = {
	color_theme = "pywal";
	theme_background = "False";
	truecolor = "True";
	force_tty = "True";
	vim_keys = "False";
	rounded_corners = "True";
	presets = ''cpu:1:default,proc:0:default cpu:0:default,mem:0:default,net:0:default cpu:0:block,net:0:tty'';
	graph_symbol = "tty";
	graph_symbol_cpu = "default";
	graph_symbol_gpu = "default";
	graph_symbol_mem = "default";
	graph_symbol_net = "default";
	graph_symbol_proc = "default";
	shown_boxes = "cpu mem net proc";
	update_ms = 2000;

	proc_sorting = "cpu lazy";
	proc_reversed = "False";
	proc_tree = "False";
	proc_colors = "True";
	proc_gradient = "True";
	proc_per_core = "False";
	proc_mem_bytes = "True";
	proc_cpu_graphs = "True";
	proc_info_smaps = "False";
	proc_left = "False";
	proc_filter_kernel = "False";
	proc_aggregate = "False";
	cpu_graph_upper = "Auto";
	cpu_graph_lower = "Auto";
	show_gpu_info = "Auto";
	cpu_invert_lower = "True";
	cpu_single_graph = "False";
	cpu_bottom = "False";
	show_uptime = "True";
	check_temp = "True";
	cpu_sensor = "Auto";
	show_coretemp = "True";
	cpu_core_map = "";
	temp_scale = "celsius";
	base_10_sizes = "False";
	show_cpu_freq = "True";
	clock_format = "%X";
	background_update = "True";
	custom_cpu_name = "";
	disks_filter = "";
	mem_graphs = "True";
	mem_below_net = "False";
	zfs_arc_cached = "True";
	show_swap = "True";
	swap_disk = "True";
        show_disks = "True";
	only_physical = "True";
	use_fstab = "True";
	zfs_hide_datasets = "False";
	disk_free_priv = "False";
	show_io_stat = "True";
	io_mode = "False";
	io_graph_combined = "False";
	io_graph_speeds = "";
	net_download = 100;
	net_upload = 100;
	net_auto = "True";
	net_sync = "True";
	net_iface = "";
	show_battery = "True";
	selected_battery = "Auto";
	show_battery_watts = "True";
	log_level = "WARNING";
	nvml_measure_pcie_speeds = "True";
	rsmi_measure_pcie_speeds = "True";
	gpu_mirror_graph = "True";
	custom_gpu_name0 = "";
	custom_gpu_name1 = "";
	custom_gpu_name2 = "";
	custom_gpu_name3 = "";
	custom_gpu_name4 = "";
	custom_gpu_name5 = "";
     };
  };

 home.file.".config/fastfetch/config.jsonc".source = /home/aqua/flake/config.jsonc; 	
  

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;

    settings = {
      "$mod" = "SUPER";
      "$shiftMod" = "SUPER SHIFT";

      "$terminal" = "kitty";
      "$browser" = "zen";
      "$fileManager" = "GSK_RENDERER=gl nautilus";
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

	 "QT_QPA_PLATFORMTHEME.qt6ct"

	 "BRAVE_BROWSER, ${pkgs.brave}"
      ];

      # ------------------------------------------
      # Startup
      # ------------------------------------------

      exec-once = [
         "waybar"
	 "hypridle"
	 "nm-applet"
      ];

      # ------------------------------------------
      # Monitors
      # ------------------------------------------

      xwayland = {
	  force_zero_scaling = true;
      };
      
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
	"$mod, L, exec, pkill waybar || waybar"
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
	 inactive_opacity = 0.8;
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

    extraConfig = ''
	monitor= eDP-2 ,2560x1600@165,auto,1.33
	monitor = , preferred, auto, 1, mirror, eDP-2

	windowrulev2 = opacity 1.0 override 0.85 override, class:zen
	windowrulev2 = opacity 0.8 override 0.75 override, class:kitty
	windowrulev2 = opacity 0.9 override 0.85 override, class:webstorm
	windowrulev2 = opacity 1.0 override 1.0 override, title:Spotify
	windowrulev2 = opacity 1.0 override 0.6 override, class:vesktop
	windowrulev2 = opacity 1.0 override 0.95 override, class:yaak
	windowrulev2 = size 800 600, class:zen-browser,title:Save Image
    '';
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
		preload = ["/home/aqua/Pictures/wallpapers/aira.png"];
		wallpaper = [", /home/aqua/Pictures/wallpapers/aira.png"];
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

  programs.waybar = {
      enable = true;

      style = ''
	
  /* `otf-font-awesome` is required to be installed for icons */

@import '/home/aqua/.config/waybar/colors-waybar.css';
@import url("/home/aqua/.cache/wal/colors-waybar.css");
*{
font-family: Material Design Icons, IBM Plex Mono, Iosevka Nerd Font;
  font-size: 19px;
}

window#waybar {
  background-color: transparent;
  color: #ffffff;
  transition-property: background-color;
  transition-duration: 0.5s;
  border: none;
}

window#waybar.hidden {
  opacity: 0.1;
}

#window {
  color: #64727d;
}

#clock,
#cpu,
#memory,
#custom-media,
#tray,
#mode,
#custom-lock,
#workspaces,
#idle_inhibitor,
#custom-power-menu,
#custom-launcher,
#custom-spotify,
#custom-weather,
#custom-weather.severe,
#custom-weather.sunnyDay,
#custom-weather.clearNight,
#custom-weather.cloudyFoggyDay,
#custom-weather.cloudyFoggyNight,
#custom-weather.rainyDay,
#custom-weather.rainyNight,
#custom-weather.showyIcyDay,
#custom-weather.snowyIcyNight,
#custom-weather.default {
  color: #e5e5e5;
  border-radius: 6px;
  padding: 2px 10px;
  background-color: #252733;
  border-radius: 8px;
  font-size: 15px;

  margin-left: 4px;
  margin-right: 4px;

  margin-top: 5px;
  margin-bottom: 3px;
}

#cpu {
	background-color: @color0;
  color: @color13;
}

#memory {
  	background-color: @color0;
  color: @color13;

}

#workspaces button {
  	background-color: @color0;
  color: @color13;
box-shadow: none;
 margin-left: 3px;
 margin-right: 3px;

  padding-right: 4px;
  padding-left: 4px;

  
  transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
}

#workspaces button.active {
  color: @color0;
  background-color: @color13;
  padding-left: 8px;
  padding-right: 8px;
  margin-left: 5px;
  margin-right: 5px;
  transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
}

/* If workspaces is the leftmost module, omit left margin 
.modules-left > widget:first-child > #workspaces {
  margin-left: 0;
}
 If workspaces is the rightmost module, omit right margin 
.modules-right > widget:last-child > #workspaces {
  margin-right: 0;
}*/

#custom-launcher {
  margin-left: 12px;

  padding-right: 20px;
  padding-left: 14px;

  font-size: 22px;

  	background-color: @color0;
  color: @color13;


  margin-top: 8.5px;
  margin-bottom: 8.5px;
}

#backlight,
#battery,
#pulseaudio,
#network {
  	background-color: @color0;
  color: @color13;

  padding: 0em 2em;

  font-size: 20px;

  padding-left: 7.5px;
  padding-right: 7.5px;

  padding-top: 3px;
  padding-bottom: 3px;

  margin-top: 7px;
  margin-bottom: 7px;

  font-size: 20px;
}

#pulseaudio {
  	background-color: @color0;
  color: @color13;

  padding-left: 9px;
  font-size: 22px;
}

#pulseaudio.muted {
  color: #fb958b;
  padding-left: 9px;
  font-size: 22px;
}

#backlight {
  	background-color: @color0;
  color: @color13;

  padding-right: 5px;
  padding-left: 8px;
  font-size: 21.2px;
}

#network {
  padding-left: 0.2em;
  	background-color: @color0;
  color: @color13;

  border-radius: 8px 0px 0px 8px;
  padding-left: 12px;
  padding-right: 14px;
  font-size: 20px;
}

#network.disconnected {
  color: #fb958b;
}

#battery {
  	background-color: @color0;
  color: @color13;

  border-radius: 0px 8px 8px 0px;
  padding-right: 2px;
  font-size: 22px;
}

#battery.critical,
#battery.warning,
#battery.full,
#battery.plugged {
  	background-color: @color0;
  color: @color13;

  padding-left: 6px;
  padding-right: 12px;
  font-size: 22px;
}

#battery.charging { 
  font-size: 18px;
  padding-right: 13px;
  padding-left: 4px;
}

#battery.full,
#battery.plugged {
  font-size: 22.5px;
  padding-right: 10px;
}

@keyframes blink {
  to {
    background-color: rgba(30, 34, 42, 0.5);
    color: #abb2bf;
  }
}

#battery.warning {
  color: #ecd3a0;
}

#battery.critical:not(.charging) {
  color: #fb958b;
}

#custom-lock {
  color: #ecd3a0;
  padding: 0 15px 0 15px;
  margin-left: 7px;
  margin-top: 7px;
  margin-bottom: 7px;
}

#clock {
  	background-color: @color0;
  color: @color13;

  font-family: Iosevka Nerd Font;
  font-weight: bold;
  margin-top: 7px;
  margin-bottom: 7px;
}

#custom-power-menu {
  background-color: @color0;
  color: @color13;

  margin-right: 7px;
  border-radius: 8px;
  padding: 0 6px 0 9px;
  margin-top: 7px;
  margin-bottom: 7px;
}

tooltip {
  font-family: Iosevka Nerd Font;
  border-radius: 15px;
  padding: 15px;
  background-color: #1f232b;
}

tooltip label {
  font-family: Iosevka Nerd Font;
  padding: 5px;
}

label:focus {
  background-color: #1f232b;
}

#tray {
  background-color: @color0;
  margin-right: 8px;
  margin-top: 7px;
  margin-bottom: 7px;
  font-size: 30px;
}


#idle_inhibitor {
  background-color: #242933;
}

#idle_inhibitor.activated {
  background-color: #ecf0f1;
  color: #2d3436;
}

#custom-spotify {
  	background-color: @color0;
  color: @color13;



}

#custom-weather {
  font-family: Iosevka Nerd Font;
  font-size: 19px;
  color: #8a909e;
}

#custom-weather.severe {
  color: #eb937d;
}

#custom-weather.sunnyDay {
  color: #c2ca76;
}

#custom-weather.clearNight {
  color: #cad3f5;
}

#custom-weather.cloudyFoggyDay,
#custom-weather.cloudyFoggyNight {
  color: #c2ddda;
}

#custom-weather.rainyDay,
#custom-weather.rainyNight {
  color: #5aaca5;
}

#custom-weather.showyIcyDay,
#custom-weather.snowyIcyNight {
  color: #d6e7e5;
}

#custom-weather.default {
  color: #dbd9d8;
}

      '';

      settings = [{
	height = 25;
	layer = "top";
	"modules-left" = [
	   "custom/launcher"
	   "cpu"
	   "memory"
	   "hyprland/workspaces"
	];
	"modules-right" = [
	   "custom/spotify"
	   "tray"
	   "network"
	   "pulseaudio"
	   "backlight"
	   "battery"
	   "clock"
	];

	"hyprland/workspaces" = {
	    "disable-scroll" = true;
	    "all-outputs" = true;
	    "on-click" = "activate";
	    "persistent_workspaces" = {
	    	"1"= [];
            	"2"= [];
            	"3"= [];
            	"4"= [];
            	"5"= [];
            	"6"= [];
            	"7"= [];
            	"8"= [];
            	"9"= [];
            	"10"= [];
	    };
	};

	"hyprland/window" = {
	   format = "{}";
	};

	tray = {
	  "icon-size" = 25;
	  spacing = 10;
	};
      }];
  };

  programs.pywal = {
	enable = true;
  };

  programs.home-manager.enable = true;
}
