{pkgs-stable, ...}: {
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;

  virtualisation = {
    libvirtd = {
      enable = true;

      qemu = {
        package = pkgs-stable.qemu_kvm;
      };
    };

    spiceUSBRedirection.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
