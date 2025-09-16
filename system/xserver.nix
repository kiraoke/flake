{pkgs, ...}: {
  services.xserver = {
    enable = true;
    xkb.layout = "us";
    xkb.options = "caps:swapescape";

    windowManager.i3.enable = true;
  };

  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = ["*"];
        settings = {
          main = {
            rightalt = "rightcontrol";
          };
        };
      };
    };
  };

  services.libinput = {
    enable = true;
    touchpad = {
      naturalScrolling = true;
    };
  };
}
