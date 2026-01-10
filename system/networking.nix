{...}: {
  networking = {
    hostName = "senzawa";

    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
      trustedInterfaces = ["virbr0" "vnet0"];
    };
  };
}
