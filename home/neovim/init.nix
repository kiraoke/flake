{...}: {
  programs.nixvim.enable = true;

  imports = [
    ./cmp.nix
    ./colorscheme.nix
    ./comment.nix
    ./harpoon.nix
    ./oil.nix
    ./keymaps.nix
    ./lsp.nix
    ./options.nix
    ./plugins.nix
  ];
}
