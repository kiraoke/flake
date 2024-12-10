{pkgs-stable, ...}: {
  programs.cava = {
    enable = true;
    package = pkgs-stable.cava;

    settings = {
      general = {
        framerate = 60;
        bar_width = 5;
        bar_spacing = 1;
      };
    };
  };
}
