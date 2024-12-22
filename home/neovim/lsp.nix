{pkgs, ...}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      gopls.enable = true;
      nixd.enable = true;
      prolog_ls = {
        enable = true;
        package = pkgs.swi-prolog;
      };
      ruff.enable = true;
      ts_ls.enable = true;
      denols.enable = true;
    };

    keymaps = {
      diagnostic = {
        "zd" = "goto_prev";
        "nd" = "goto_next";
      };

      lspBuf = {
        "gd" = "definition";
        "gD" = "references";
        "gt" = "type_definition";
        "gi" = "implementation";
        "gh" = "hover";
      };
    };
  };

  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources = {
      formatting = {
        stylua.enable = true;
        alejandra.enable = true;
      };
    };
  };

  programs.nixvim.plugins.rustaceanvim.enable = true;
}
