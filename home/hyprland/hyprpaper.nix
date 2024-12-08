{...}: {
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = ["/home/aqua/Pictures/wallpapers/joira.png"];
      wallpaper = [", /home/aqua/Pictures/wallpapers/joira.png"];
    };
  };
}
