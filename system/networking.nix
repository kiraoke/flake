{...}: {
  networking = {
    hostName = "kage";

    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      trustedInterfaces = ["virbr0" "vnet0"];
    };
  };
}
