{pkgs, ...}: {
  programs.nixvim.plugins = {
    treesitter.enable = true;
    treesitter-context.enable = true;
    web-devicons.enable = true;
    cloak.enable = true;
    rainbow-delimiters.enable = true;
    todo-comments.enable = true;
    fzf-lua = {
      enable = true;
    };

    harpoon.enable = true;
    trouble.enable = true;
    zen-mode.enable = true;
    fugitive.enable = true;
    lualine.enable = true;
    auto-save.enable = true;

    fidget = {
      enable = true;
      progress = {
        suppressOnInsert = true;
        ignoreDoneAlready = true;
        pollRate = 0.5;
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
