{...}: {
  programs.nixvim.colorschemes.rose-pine = {
    enable = true;
    settings = {
      variant = "moon";
      enable = {
        terminal = true;
      };

      dim_inactive_windows = false;
      extend_background_behind_borders = true;

      styles = {
        bold = true;
        italic = true;
        transparency = true;
      };
    };
  };
}
