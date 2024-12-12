{...}: {
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      default_file_explorer = true;
      delete_to_trash = true;
      columns = [
        "icon"
      ];
      skip_confirm_for_simple_edits = true;
      view_options = {
        show_hidden = true;
        natural_order = true;
        win_options = {wrap = true;};
      };

      keymaps = {
        # Open in horizontal split
        "<C-s>" = "actions.select_split";
        # Open in vertical split
        "<C-v>" = "actions.select_vsplit";
        # Open in a new tab
        "<C-t>" = "actions.select_tab";
      };
    };
  };
}
