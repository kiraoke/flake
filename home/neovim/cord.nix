{...}: {
  programs.nixvim.plugins.cord = {
    enable = true;

    settings = {
      editor = {
        client = "vim";
        tooltip = "God's Text Editor";
      };
    };
  };
}
