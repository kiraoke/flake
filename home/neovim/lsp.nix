{
  pkgs,
  ...
}: {
  programs.nixvim.plugins.lsp = {
    enable = true;
    inlayHints = true;

    servers = {
      bashls.enable = true;
      clangd.enable = true;
      gopls.enable = true;
      yamlls.enable = true;
      lua_ls.enable = true;
      nixd.enable = true;
      prolog_ls = {
        enable = true;
        package = pkgs.swi-prolog;
      };
      ruff.enable = true; # this is python lsp written in rust
      html.enable = true;
      cssls.enable = true;
      tailwindcss.enable = true;
      jsonls.enable = true;
      ts_ls.enable = true;
      # denols.enable = true;
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
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        alejandra.enable = true;
      };
    };
  };

  programs.nixvim.plugins.rustaceanvim.enable = true; 
}
