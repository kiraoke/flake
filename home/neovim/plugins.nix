{pkgs, ...}: {
  programs.nixvim.plugins = {
    treesitter.enable = true;
    treesitter-context.enable = true;
    web-devicons.enable = true;
    rainbow-delimiters.enable = true;
    todo-comments.enable = true;

    fzf-lua = {
      enable = true;
     keymaps = {
       "<leader>pf" = "files"; 
       "<leader>ps" = "live_grep";
       "<leader>pg" = "git_files";
     };
    };

    trouble.enable = true;
    zen-mode.enable = true;
    fugitive.enable = true;
    lualine.enable = true;

    fidget = {
      enable = true;
      progress = {
        suppressOnInsert = true;
        ignoreDoneAlready = true;
        pollRate = 0.5;
      };
    };

    cloak = {
      enable = true;
      settings = {
        enabled = true;
        cloak_character = "*";
        highlight_group = "Comment";

        patterns = [
          {
            cloak_pattern = "=.*";
            file_pattern = [
              ".env*"
              "wrangler.toml"
              ".dev.vars"
            ];
          }
        ];
      };
    };

    auto-save = {
      enable = true;
      settings = {
        enable = true;
        condition = ''
          function(buf)
              local fn = vim.fn
              local utils = require("auto-save.utils.data")

              if utils.not_in(fn.getbufvar(buf, "&filetype"), {'oil'}) then
                return true
              end
            return false
          end
        '';
        debounce_delay = 1000;
        write_all_buffers = true;
      };
    };
  };

  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "vim-be-good";
      src = pkgs.fetchFromGitHub {
        owner = "ThePrimeagen";
        repo = "vim-be-good";
        rev = "4fa57b7957715c91326fcead58c1fa898b9b3625";
        hash = "sha256-XVFq3Gb4C95Y0NYKk08ZjZaGLVF6ayPicIAccba+VRs=";
      };
    })
  ];
}
