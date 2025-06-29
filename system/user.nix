{pkgs, ...}: {
  users.users.kira = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "storage"
      "power"
      "video"
      "audio"
      "docker"
      "libvirtd"
    ]; 
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
