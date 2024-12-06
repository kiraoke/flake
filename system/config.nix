{
  pkgs,
  inputs,
  ...
}: {
  imports = [
   ./audio.nix
   ./bluetooth.nix
   ./bootloader.nix
   ./config.nix
   ./devices.nix
   ./docker.nix
   ./environment.nix
   ./fonts.nix
   ./graphics.nix
   ./networking.nix
   ./packages.nix
   ./programs.nix
   ./sddm.nix
   ./spicetify.nix
   ./ssh.nix
   ./user.nix
   ./xserver.nix
  ];

  nix.nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.gc = {
    automatic = true;
    dates = "weekly";
  };

  nix.settings.auto-optimise-store = true;

  # -------------------- LOCALIZATION --------------------------
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # ------------------- ZRAM -----------------------------------
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 5;
  };
}
