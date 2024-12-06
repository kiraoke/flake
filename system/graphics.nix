{config, ...}: {
  services.xserver.videoDrivers = ["nvidia" "amdgpu"];

  hardware.nvidia = {
    modesetting.enable = true;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };

      amdgpuBusId = "PCI:5:0:0";
      nvidiaBusId = "PCI:1:0:0";
    };

    # see arch wiki preserve nvidia video memory
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    open = false; # disable the new nvidia open source drivers

    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };
}
