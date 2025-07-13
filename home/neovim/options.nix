{userpath, ...}: {
  programs.nixvim.globals.mapleader = " ";

  programs.nixvim.globalOpts = {
    number = true;
    relativenumber = true;
    fillchars = {eob = " ";};

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";

    # Search
    ignorecase = true;
    smartcase = true;

    clipboard = {
      providers = {
        wl-copy.enable = true; # Wayland
        xsel.enable = true; # For X11
      };
      register = "unnamedplus";
    };

    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 2;
    expandtab = true;
    smarttab = false;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 8;
    smartindent = true;
    swapfile = false;
    backup = false;
    wrap = false;
    undofile = true;
    undodir = "${userpath}/.vim/undodir";


    hlsearch = true;
    incsearch = true;

    termguicolors = true;

    updatetime = 50;
  };

  programs.nixvim.diagnostic.settings.virtual_text = true;
}
