{userpath, ...}: {
  home.file."btop" = {
    source = ../dots/btop;
    recursive = true;
    target = "${userpath}.config/btop";
  };
}
