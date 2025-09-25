{
  inputs,
  pkgs,
  pkgs-stable,
  ...
}: let
  system = with pkgs; [
    zsh
    kitty
    timeshift
    pulseaudio
    ntfs3g
    libnotify
    go-mtpfs
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
    cpuid
  ];

  vulkan = with pkgs; [
    vulkan-tools
    vulkan-headers
    vulkan-loader
    vulkan-validation-layers
  ];

  dev = with pkgs; [
    git
    wget
    gcc
    gnumake
    gdb
    SDL2
  ];

  apps = with pkgs; [
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    inputs.zen-browser.packages."${pkgs.system}".default
    nautilus
    xclip
    wl-clipboard
    eza
    cloudflare-warp
  ];

  virt = with pkgs-stable; [
    distrobox
    qemu
    virt-manager
    virt-viewer
    virtiofsd
    spice
    spice-gtk
    spice-protocol
  ];
in {
  environment.systemPackages = system ++ vulkan ++ dev ++ apps ++ virt;
}
