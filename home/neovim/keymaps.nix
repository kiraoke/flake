{...}: {
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>pv";
      action = ":Oil<CR>";
      options = {
        silent = true;
        desc = "Open file explorer";
      };
    }
    {
      mode = "n";
      key = "<leader>h";
      action = ":nohls<CR>";
      options = {
        silent = true;
        desc = "Open file explorer";
      };
    }
    {
      mode = "x";
      key = "<leader>p";
      action = ''"_dP'';
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
      key = "<leader>ca";
      action.__raw = "vim.lsp.buf.code_action";
      options = {
        desc = "Get code actions";
      };
    }
    {
      mode = "n";
      key = "<leader>rn";
      action.__raw = "vim.lsp.buf.rename";
      options = {
        desc = "Rename symbol";
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
      key = "<C-k>k";
      action = "<C-w>k";
      options = {
        silent = true;
        desc = "Move to top window";
      };
    }
    # Ctrl+l to move to right window
    {
      mode = "n";
      key = "<C-l>l";
      action = "<C-w>l";
      options = {
        silent = true;
        desc = "Move to right window";
      };
    }
    {
      mode = "n";
      key = "<C-m>";
      action = "<C-w>w";
      options = {
        silent = true;
        desc = "Move to right window";
      };
    }

    # TROUBLE keymaps
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>Trouble diagnostics toggle<cr>";
      options.desc = "Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>tT";
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      options.desc = "Buffer Diagnostics (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>cs";
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      options.desc = "Symbols (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>cl";
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      options.desc = "LSP Definitions / references / ... (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>tL";
      action = "<cmd>Trouble loclist toggle<cr>";
      options.desc = "Location List (Trouble)";
    }
    {
      mode = "n";
      key = "<leader>tQ";
      action = "<cmd>Trouble qflist toggle<cr>";
      options.desc = "Quickfix List (Trouble)";
    }

    # some other keymaps move code in visual mode
    {
      mode = "v";
      key = "J";
      action = ":m '>+1<CR>gv=gv";
    }
    {
      mode = "v";
      key = "K";
      action = ":m '<-2<CR>gv=gv";
    }

    # undo tree
    {
      mode = "n";
      key = "<leader>tu";
      action = ":UndotreeToggle<CR>";
      options.desc = "toggles undo tree";
    }

    # set to system clipboard
    {
      mode = "v";
      key = "<leader>y";
      action = ''"+y'';
    }

    {
      mode = "n";
      key = "<leader>y";
      action = ''"+y'';
    }

    # harpoon
    {
      mode = "n";
      key = "<leader>a";
      action.__raw = "function() require'harpoon':list():add() end";
    }
    {
      mode = "n";
      key = "<leader>f";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
    }
    {
      mode = "n";
      key = "<leader>q";
      action.__raw = "function() require'harpoon':list():select(1) end";
    }
    {
      mode = "n";
      key = "<leader>w";
      action.__raw = "function() require'harpoon':list():select(2) end";
    }
    {
      mode = "n";
      key = "<leader>e";
      action.__raw = "function() require'harpoon':list():select(3) end";
    }
    {
      mode = "n";
      key = "<leader>r";
      action.__raw = "function() require'harpoon':list():select(4) end";
    }
    # center page when control d
    {
      mode = "n";
      key = "<C-d>";
      action = "<C-d>zz";
    }
    {
      mode = "n";
      key = "<C-u>";
      action = "<C-u>zz";
    }
  ];
}
