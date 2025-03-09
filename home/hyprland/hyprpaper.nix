{userpath, ...}: let
  wallpaper = "${userpath}Pictures/wallpapers/gri4k.png";
in {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [wallpaper];
      wallpaper = [", ${wallpaper}"];
    };
  };
}
