{...}: {
  programs.nixvim.plugins.cord = {
    enable = true;

    settings = {
      editor = {
        client = "vim";
        tooltip = "神のエヂタ";
      };

      text = {
          editing = "エディティンク゚ ";
          viewing = "ヴィユインク゚";
          file_browser = "ブラウジンク゚ファイルスインー";
          plugin_manager = "マンエギンク゚パルギンスインー";
          lsp = "コンフィク゚リンク゚ LSP インー";
        };

        idle.details = "アイドリンク゚";
    };
  };
}
