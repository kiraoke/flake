{...}: {
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>pv";
      action = "<cmd>Ex<cr>";
      options = {
        silent = true;
        desc = "Open file explorer";
      };
    }
    {
      mode = "x";
      key = "<leader>p";
      action = ''"\"_dP"'';
      options = {
        silent = true;
        desc = "Paste over selection without yanking";
      };
    }
  ];

  plugins.fzf-lua.keymaps = {
    "<leader>pf" = {
      action = "files";
      options = {
        desc = "Fzf-Lua Find Files";
        silent = true;
      };
    };
    "<leader>ps" = "live_grep";
    "<leader>pg" = "git_files";
  };
}
