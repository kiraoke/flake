{...}: {
  programs.nixvim.enable = true;

  programs.nixvim.extraConfigLuaPost = ''
    vim.g.rust_recommended_style = 0

    vim.lsp.config('denols', {
          on_attach = on_attach,
          root_markers = {"deno.json", "deno.jsonc"},
          })

    vim.lsp.config('ts_ls', {
        on_attach = on_attach,
        root_markers = {"package.json"},
        single_file_support = false,
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
