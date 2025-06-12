{...}: {
  home.file.".config/zellij/themes/rose-pine.kdl".source = ../dots/rose-pine-moon.kdl;

  programs.zellij = {
    enable = true;
    settings = {
      theme = "rose-pine";
    };
  };
}
