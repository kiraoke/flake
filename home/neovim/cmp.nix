{...}: {
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      mapping = {
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-e>" = "cmp.mapping.abort()";
        "<CR>" = "cmp.mapping.confirm({ select = false })";
        "<C-y>" = "cmp.mapping.confirm({ select = true })";
        "<C-Tab>" = "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end)";
        "<S-Tab>" = "cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() else fallback() end end)";
      };
      sources = [
        {name = "path";} # filesystem paths
        {name = "nvim_lsp";} # LSP
        {name = "nvim_lua";} # Neovim's Lua API
        {name = "luasnip";} # Neovim's Lua API
      ];
      snippet.expand = "luasnip";
    };
  };

  programs.nixvim.plugins.luasnip = {
      enable = true;
      fromVscode = [{}];
    };
}
