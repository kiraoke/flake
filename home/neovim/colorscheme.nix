{...}: {
  programs.nixvim.colorschemes = {
    rose-pine = {
      enable = true;
      settings = {
        variant = "moon";
        enable = {
          terminal = true;
        };

        dim_inactive_windows = true;
        extend_background_behind_borders = true;

        styles = {
          bold = true;
          italic = true;
          transparency = true;
        };
      };
    };

    catppuccin = {
      enable = false;

      settings = {
        background = {
          dark = "latte";
          light = "latte";
        };

        dim_inactive.enabled = true;
        transparent_background = true;
      };
    };
  };
}
