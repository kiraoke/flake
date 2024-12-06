{pkgs, ...}: {
  users.users.aqua = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "storage"
      "power"
      "video"
      "audio"
      "docker"
    ]; 
  };

  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
}
