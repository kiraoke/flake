{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkbOptions = "caps:swapescape";

    windowManager.i3.enable = true;
  };

  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
    };
  };
}
