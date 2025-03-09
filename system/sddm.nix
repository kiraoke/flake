{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = let
      corners = pkgs.fetchFromGitHub {
        owner = "kiraoke";
        repo = "evadm";
        rev = "62ab6748a32959cf5ebb23995c6943df900e1b8a";
        sha256 = "sha256-zCOEZYduNfiuTbI0TUvafr2JAHTk3E1fux0F8WQFor8=";
      };
    in "${corners}";
  };
}
