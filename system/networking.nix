{...}: {
  networking = {
    hostName = "kage";

    networkmanager = {
      enable = true;
    };

    firewall.enable = true;
  };
}
