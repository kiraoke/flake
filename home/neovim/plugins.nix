{pkgs, ...}: {
  programs.nixvim.plugins = {
    treesitter.enable = true;
    treesitter-context.enable = true;
    web-devicons.enable = true;
    rainbow-delimiters.enable = true;
    todo-comments.enable = true;
    vim-be-good.enable = true;
    colorizer.enable = true;

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
      settings.progress = {
        suppress_on_insert = true;
        ignore_done_already = true;
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

    which-key = {
      enable = true;

      settings = {delay = 500;};

      luaConfig.post = ''
         vim.keymap.set("n", "<leader>?",  function()
             require("which-key").show({ global = false })
           end
        )
      '';
    };

    undotree = {
      enable = true;
    };

    render-markdown = {
      enable = true;
    };

    snacks = {
      enable = true;
      settings = {
        lazygit = {
          enable = true;
        };
      };
    };
  };

  programs.nixvim.extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "gx.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "chrishrb";
        repo = "gx.nvim";
        rev = "b01db725a001e4215f363159fc04727f6fde0a1c";
        hash = "sha256-/ktgolMALf8P6gqoGwbxdAiJaOFzUcGDJHJASuvITiI=";
      };
    })
  ];
}
