{...}: {
  programs.nixvim.enable = true;

  programs.nixvim.extraConfigLuaPost = ''
     local nvim_lsp = require('lspconfig')
     vim.g.rust_recommended_style = 0

     nvim_lsp.denols.setup ({
         on_attach = on_attach,
         root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
         })

    nvim_lsp.ts_ls.setup ({
       on_attach = on_attach,
       root_dir = nvim_lsp.util.root_pattern("package.json"),
       single_file_support = false
       })
  '';

  imports = [
    ./cmp.nix
    ./colorscheme.nix
    ./comment.nix
    ./copilot.nix
    ./cord.nix
    ./harpoon.nix
    ./oil.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./plugins.nix
    ./debugger.nix
  ];
}
