{
  pkgs,
  lib,
  pkgs-stable,
  ...
}: {
  hardware.enableAllFirmware = true;

  nixpkgs.overlays = [
    (final: prev: {
      grub2 = pkgs-stable.grub2;
    })
  ];

  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    supportedFilesystems = ["btrfs"];

    kernelParams = [
      "NVreg_UsePageAttributeTable=1"
      "NVreg_DynamicPowerManagement=0x02"
      "NVreg_PreserveVideoMemoryAllocations=1"
    ];
    kernelModules = ["kvm-amd"];

    blacklistedKernelModules = ["nouveau"];
    kernel.sysctl = {
      "vm.swappiness" = 180;
      "vm.watermark_scale_factor" = 125;
      "vm.page-cluster" = 0;
    };

    tmp.cleanOnBoot = true;
    tmp.useTmpfs = false;

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
          customIcons = [
            {
              name = "nixos";
              lineTop = "NixOS (24/10/2024, 22:16)";
              lineBottom = "Hardcore Mode, Cheats, Version: 25.05";
              customImg = builtins.path {
                path = ../assets/nixos-logo.png;
                name = "nixos-img";
              };
            }
          ];
        };
      };
    };
  };

  powerManagement.cpuFreqGovernor = "performance";
}
