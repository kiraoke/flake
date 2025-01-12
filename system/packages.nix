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
    wofi
    gnumake

    # zen browser
    inputs.zen-browser.packages."${pkgs.system}".default
    inputs.ghostty.packages."${pkgs.system}".default
    go-mtpfs

    gcc

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
