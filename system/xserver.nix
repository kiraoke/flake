{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    desktopManager.plasma5.enable = true;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
    ark
    elisa
    gwenview
    spectacle
    okular
  ];
}
