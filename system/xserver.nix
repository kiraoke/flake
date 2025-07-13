{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    windowManager.i3.enable = true;
  };
}
