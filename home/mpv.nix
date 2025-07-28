{...}: {
  programs.mpv = {
    enable = true;

    config = {
      hwdec = "auto";
      vo = "gpu";
      profile = "gpu-hq";
      border = "no";
    };
  };
}
