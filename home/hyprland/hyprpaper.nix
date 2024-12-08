{userpath, ...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = ["${userpath}Pictures/wallpapers/joira.png"];
      wallpaper = [", ${userpath}Pictures/wallpapers/joira.png"];
    };
  };
}
