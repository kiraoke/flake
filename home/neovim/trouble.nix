{...}: {
  programs.nixvim.plugins.trouble = {
    enable = true;

    settings = {
      auto_preview = true;
      auto_refresh = true;
      indent_guides = true;
    };
  };
}
