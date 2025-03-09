{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = let
      corners = pkgs.fetchFromGitHub {
        owner = "kiraoke";
        repo = "evadm";
        rev = "7240803fdba93cd67e476414fec0a505dbe13be0";
        sha256 = "sha256-JUZ+ZQ+YsiWvg4huZN06QTpp0XYRDGw7D2g2I+5+gt8=";
      };
    in "${corners}";
  };
}
