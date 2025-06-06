{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
    # (import ../packages/zen.nix {
    #   appimageTools = pkgs.appimageTools;
    #   fetchurl = pkgs.fetchurl;
    # })
    # inputs.ghostty.packages."${pkgs.system}".default
    go-mtpfs

    gcc
    gnumake
    gdb

    # sddm cursor theme dependencies
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg

    libsForQt5.dolphin
    nautilus
    xclip
    wl-clipboard
    cpuid
    eza
    eza
    distrobox
    cloudflare-warp
  ];
}
