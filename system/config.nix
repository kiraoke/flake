{
  inputs,
  ...
}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./locale.nix
    ./bootloader.nix
    ./devices.nix
    ./environment.nix
    ./graphics.nix
    ./networking.nix
    ./packages.nix
    ./programs.nix
    ./sddm.nix
    # ./spicetify.nix
    ./stylix.nix
    ./ssh.nix
    ./systemd.nix
    ./user.nix
    ./virtualisation.nix
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
  location.provider = "geoclue2";
  location.latitude = "52";
  location.longitude = "85";

  # ------------------- ZRAM -----------------------------------
  zramSwap = {
    enable = true;
    memoryPercent = 50;
    algorithm = "zstd";
    priority = 5;
  };
}
