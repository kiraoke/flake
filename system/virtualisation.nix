{...}: {
  programs.virt-manager.enable = true;
  services.qemuGuest.enable = true;

  virtualisation = {
    libvirtd.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
    };
  };
}
