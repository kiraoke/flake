{userpath, ...}: {
  wayland.windowManager.hyprland.settings.general = let
    readFileIfExists = path:
      if builtins.pathExists path
      then builtins.readFile path
      else "";

    content =
      builtins.fromJSON
      (readFileIfExists "${userpath}.cache/wal/colors.json");
    color3 = toString content.colors.color3;

    # remove # from #color hex code
    afterFirst = str:
      builtins.substring 1 (builtins.stringLength str - 1) str;
  in {
    gaps_in = 5;
    gaps_out = 6;
    border_size = 3;

    "col.active_border" = "rgba(${afterFirst color3}B3) rgb(0,0,0) 208deg";
    "col.inactive_border" = "rgba(59595900)";

    resize_on_border = true;
    allow_tearing = true;

    layout = "dwindle";
  };
}
