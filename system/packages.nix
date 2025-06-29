{
  inputs,
  pkgs,
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

  dev = with pkgs; [
    git
    wget
    gcc
    gnumake
    gdb
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

  virt = with pkgs; [
    distrobox
    qemu
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
  ];
in {
  environment.systemPackages = system ++ dev ++ apps ++ virt;
}
