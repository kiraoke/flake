{...}: {
  networking = {
    hostName = "hoshino";

    networkmanager = {
      enable = true;
    };

    firewall.enable = true;
  };
}
