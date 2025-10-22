{...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "kiraoke";
      user.email = "kiraokeku@gmail.com";
    };
  };
}
