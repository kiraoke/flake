{
  pkgs,
  lib,
  config,
  ...
}: {
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

  specialisation = {
    gaming-time.configuration = {
      boot.kernelPackages = lib.mkForce pkgs.linuxPackages_cachyos;
      hardware.nvidia = {
        prime.sync.enable = lib.mkForce true;
        powerManagement.finegrained = lib.mkForce false;

        prime.offload = {
          enable = lib.mkForce false;
          enableOffloadCmd = lib.mkForce false;
        };
      };
    };
  };
}
