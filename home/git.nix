{...}: {
  programs.git = {
    enable = true;

    userName = "kiraoke";
    userEmail = "kiraokeku@gmail.com";

    config = {
      url = {
        "ssh://git@github.com/" = {insteadOf = "https://github.com";};
      };
    };
  };
}
