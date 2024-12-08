{userpath, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = ["${userpath}Pictures/wallpapers/koira.png"];
      wallpaper = [", ${userpath}Pictures/wallpapers/koira.png"];
    };
  };
}
