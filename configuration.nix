# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
 
{ config, lib, pkgs, inputs, ... }:
 
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
 
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "btrfs" ];
  hardware.enableAllFirmware = true;
  nixpkgs.config.allowUnfree = true;  

  powerManagement.cpuFreqGovernor = "performance";

  hardware.graphics =  {
     enable = true;
     enable32Bit = true;
  };

  # Use the grub-boot EFI boot loader.
  boot.loader = {
    systemd-boot.enable = false;
    efi.canTouchEfiVariables = true;
    efi.efiSysMountPoint = "/boot";
    timeout = 20;

    grub = {
	enable = true;
	devices = ["nodev"];
	efiSupport = true;
	useOSProber = true;
	gfxmodeEfi = "2560x1600";
	timeoutStyle = "menu";

	extraConfig = ''
	   GRUB_TERMINAL_OUTPUT="gfxterm"
	   GRUB_GFXMODE="2560x1600"
	'';

	minegrub-world-sel = {
	  enable = true;
      customIcons = [];
	};
    };
  };
 
  networking = {
    hostName = "hoshino";
    networkmanager.enable = true;
    firewall.enable = true;
  };
 
  # Enable flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];
 
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";
 
  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
 
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };
 
  # Enable the X11 windowing system.
  services.xserver.enable = true;
 
  # Configure keymap in X11
  services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
 
  # Enable the KDE Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = let 
      corners = pkgs.fetchFromGitHub {
        owner = "ingineous";
        repo = "corners";
	rev = "8953e16c11e82e1dd29601d2738fc56a1c127edd";
	sha256 = "sha256-hTwbJM0fXq1yO0NcqxU66gn/73Gu0R8s+B7ZDlttcw0=";
      };
    in "${corners}";  

  };

  services.xserver.desktopManager.plasma5.enable = true;
 
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];
  hardware.nvidia = {
     modesetting.enable = true;

     prime = {
       offload = {
         enable = true;
	 enableOffloadCmd = true;
       };

       amdgpuBusId = "PCI:5:0:0";
       nvidiaBusId = "PCI:1:0:0";
     };
     
     # see arch wiki preserve nvidia video memory
     powerManagement.enable = true;
     powerManagement.finegrained = true;

     open = false; # disable the new nvidia open source drivers

     nvidiaSettings = true;
     package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
 
  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
    wireplumber.enable = true;
  };
 
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
 
  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };
 
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aqua = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "storage" "power" "video" "audio"]; # Enable ‘sudo’ for the user.
  };
 
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = [
    pkgs.vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    pkgs.git
    pkgs.zsh
    pkgs.wget
    pkgs.kitty
    pkgs.timeshift
    (pkgs.waybar.overrideAttrs (oldAttrs: {
            mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
      })
    )
    pkgs.mako
    pkgs.libnotify
    pkgs.wofi

    # zen browser
    inputs.zen-browser.packages."${pkgs.system}".specific
    pkgs.go-mtpfs

    pkgs.gcc

    # sddm cursor theme dependencies
    pkgs.libsForQt5.qt5.qtquickcontrols2
    pkgs.libsForQt5.qt5.qtgraphicaleffects
    pkgs.libsForQt5.qt5.qtsvg
    pkgs.xclip
  ];

   users.defaultUserShell = pkgs.zsh;
   programs.zsh.enable = true;
 
  # Set the default editor to vim
  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;
  
  programs.hyprland = {
     enable = true;
     xwayland.enable = true;
#     package = inputs.hyprland.packages."${pkgs.system}".hyprland;
  };

  programs.spicetify = 
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
     {
      enable = true;
      enabledExtensions = [
        spicePkgs.extensions.adblock
        spicePkgs.extensions.beautifulLyrics
	{
	 name = "romanji.js";
	 src = pkgs.fetchFromGitHub {
	   owner = "ingineous";
	   repo = "romanji";
	   rev = "c3dba44f50314005159c7e37842ed0c2ab117dac";
	   hash = "sha256-wz1ft9nhX8ND4eJhsjB7L64MpAscccS2QbHB0Cim8dw=";
	 };
	}
	{
	  name = "romaja.js";
	  src = pkgs.fetchFromGitHub {
	    owner = "ingineous";
	    repo = "romaja";
	    rev = "88fcbf91cb6afa36b140c7b3cfd22276dc9dca7b";
	    hash = "sha256-UisN2lUZf3/NJyagPuLNvQX4SDZmT6ghcieR2G+NsNY=";
	  };
	}
	{
	  name = "waveform.js";
	  src = pkgs.fetchFromGitHub {
	    owner = "SPOTLAB-Live";
	    repo = "Spicetify-waveform";
	    rev = "89fa8a6e29258984bc296790e6f41ee017e87c71";
	    hash = "sha256-LOOtdlnpKRE/D95hbuk8vTtFUsA+nUtmsKTiQiy2s7w=";
	  };
	}
      ];
      enabledCustomApps = with spicePkgs.apps; [
	marketplace
      ];
      theme = {
	name = "Galaxy";
	src = pkgs.fetchFromGitHub {
    	  owner = "harbassan";
    	  repo = "spicetify-galaxy";
	  rev = "45467bad47526c49290a9273dca02085b9a55842";
	  hash = "sha256-5MPmUznHx5OFUsF3lbrBs3QDdUv8EO2srNywxy1S3LE=";
  	};
	injectCss = true;
  	injectThemeJs = true;
  	replaceColors = true;
  	homeConfig = true;
  	overwriteAssets = true;
  	additonalCss ="";
      };
     };

  environment.sessionVariables = {
     # If your cursor becomes invisible
     WLR_NO_HARDWARE_CURSORS = "1";
     # hint electron apps to use wayland
     NIXOS_OZONE_WL = "1";
  };

  programs.ssh = {
        startAgent = true;
        extraConfig = ''
            AddKeysToAgent yes
        '';
    };
  

#  xdg.portal.enable = true;
#  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
 
  # List services that you want to enable:
 
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
 
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
 
  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;
 
  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment?
}
 
