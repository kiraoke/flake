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
    {
      mode = "n";
      key = "<leader>gf";
      action.__raw = "vim.lsp.buf.format";
      options = {
        desc = "Format the code using lsp";
      };
    }
    {
      mode = "n";
      key = "<leader>n";
      action = ":ASToggle<CR>";
      options = {
        desc = "Toggle Auto Save";
      };
    }
    # Ctrl+h to move to left window
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        silent = true;
        desc = "Move to left window";
      };
    }
    # Ctrl+j to move to bottom window
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        silent = true;
        desc = "Move to bottom window";
      };
    }
    # Ctrl+k to move to top window
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        silent = true;
        desc = "Move to top window";
      };
    }
    # Ctrl+l to move to right window
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        silent = true;
        desc = "Move to right window";
      };
    }
    {
      mode = "n";
      key = "<leader>z";
      action = "<C-w>w";
      options = {
        silent = true;
        desc = "Move to right window";
      };
    }
  ];
}
