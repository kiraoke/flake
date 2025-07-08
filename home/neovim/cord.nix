{...}: {
  programs.nixvim.plugins.cord = {
    enable = true;

    settings = {
      editor = {
        client = "vim";
        tooltip = "神のエヂタ";
      };

      text = {
          editing = "エディティク゚ ";
        };
    };
  };
}
