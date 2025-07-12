{...}: {
  programs.nixvim.plugins.cord = {
    enable = true;

    settings = {
      editor = {
        client = "vim";
        tooltip = "神のエヂタ";
      };

      text = {
          editing = "エディティング ";
          viewing = "ヴィユイング";
          file_browser = "ブラウジングファイルスインー";
          plugin_manager = "マンエギングパルギンスインー";
          lsp = "コンフィグリング LSP インー";
        };

        idle.details = "アイドリング";
    };
  };
}
