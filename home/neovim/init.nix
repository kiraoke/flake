{...}: {
  programs.nixvim.enable = true;

  programs.nixvim.extraConfigLuaPost = ''
      vim.g.rust_recommended_style = 0

      vim.lsp.config('denols', {
          cmd = { 'deno', 'lsp' },
          root_dir = vim.fs.root(0, { 'deno.json', 'deno.jsonc' }),
          on_attach = on_attach,
      })

      vim.lsp.config('ts_ls', {
          cmd = { 'typescript-language-server', '--stdio' },
          root_dir = vim.fs.root(0, { 'package.json' }),
          single_file_support = false,
          on_attach = on_attach,
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
