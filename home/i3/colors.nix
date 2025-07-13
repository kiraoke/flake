{lib, ...}: {
  xsession.windowManager.i3.config.colors = lib.mkForce {
    background = "#282828";
    focused = {
      background = "#cba882";
      border = "#cba882";
      childBorder = "#cba882";
      indicator = "#fe8019";
      text = "#62150d";
    };
    focusedInactive = {
      background = "#3c3836";
      border = "#3c3836";
      childBorder = "#3c3836";
      indicator = "#fe8019";
      text = "#ebdbb2";
    };
    unfocused = {
      background = "#280000";
      border = "#280000";
      childBorder = "#280000";
      indicator = "#280000";
      text = "#62150d";
    };
    urgent = {
      background = "#cc241d";
      border = "#cc241d";
      childBorder = "#cc241d";
      indicator = "#cc241d";
      text = "#ebdbb2";
    };
    placeholder = {
      background = "#1d2021";
      border = "#1d2021";
      childBorder = "#1d2021";
      indicator = "#1d2021";
      text = "#928374";
    };
  };
}
