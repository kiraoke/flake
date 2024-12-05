{pkgs, ...}: {
  hardware.enableAllFirmware = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["btrfs"];

    kernelParams = ["NVreg_UsePageAttributeTable=1"];

    blacklistedKernelModules = ["nouveau"];
    kernel.sysctl = {
      "vm.swappiness" = 180;
      "vm.watermark_scale_factor" = 125;
      "vm.page-cluster" = 0;
    };

    loader = {
      systemd-boot.enable = false;
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot";
      timeout = 20;

      grub = {
        enable = true;
        devices = ["nodev"];
        efiSupport = true;
        useOSProber = true;
        gfxmodeEfi = "2560x1600";
        timeoutStyle = "menu";
        copyKernels = true;
        configurationLimit = 5;

        extraConfig = ''
          GRUB_TERMINAL_OUTPUT="gfxterm"
          GRUB_GFXMODE="2560x1600"
        '';

        minegrub-world-sel = {
          enable = true;
          customIcons = [];
        };
      };
    };
  };

  powerManagement.cpuFreqGovernor = "performance";
}
