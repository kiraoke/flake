{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    git
    zsh
    wget
    kitty
    timeshift
    (waybar.overrideAttrs (oldAttrs: {
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    }))
    libnotify
    ntfs3g
    pulseaudio # only for utilities, pipewire is used for everything

    # zen browser
    inputs.zen-browser.packages."${pkgs.system}".default
    go-mtpfs

    gcc
    gnumake
    gdb

    # sddm cursor theme dependencies
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg

    nautilus
    xclip
    wl-clipboard
    cpuid
    eza
    distrobox
    cloudflare-warp
  ];
}
