{...}: {
  programs.nixvim.enable = true;

  imports = [
    ./cmp.nix
    ./colorscheme.nix
    ./lsp.nix
    ./options.nix
    ./plugins.nix
  ];
}
