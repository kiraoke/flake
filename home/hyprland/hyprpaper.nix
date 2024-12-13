{userpath, ...}: let
  wallpaper = "${userpath}Pictures/wallpapers/lulu.jpg";
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
