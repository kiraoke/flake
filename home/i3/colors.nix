{lib, ...}: {
  xsession.windowManager.i3.config.colors = lib.mkForce {
    background = "#282828";
    focused = {
      background = "#689d6a";
      border = "#689d6a";
      childBorder = "#689d6a";
      indicator = "#fe8019";
      text = "#282828";
    };
    focusedInactive = {
      background = "#3c3836";
      border = "#3c3836";
      childBorder = "#3c3836";
      indicator = "#fe8019";
      text = "#ebdbb2";
    };
    unfocused = {
      background = "#32302f";
      border = "#32302f";
      childBorder = "#32302f";
      indicator = "#282828";
      text = "#a89984";
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
