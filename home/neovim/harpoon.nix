{...}: {
  programs.nixvim.harpoon = {
    enable = true;
    keymaps = {
      addFile = "<leader>a";
      toggleQuickMenu = "<leader>f";

      navFile = {
        "1" = "<leader>q";
        "2" = "<leader>w";
        "3" = "<leader>e";
        "4" = "<leader>r";
      };
    };
  };
}
