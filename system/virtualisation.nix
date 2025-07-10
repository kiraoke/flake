{pkgs, ...}: {
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;
    };

    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
