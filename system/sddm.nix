{pkgs, ...}: {
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;

    theme = let
      corners = pkgs.fetchFromGitHub {
        owner = "ingineous";
        repo = "corners";
        rev = "8953e16c11e82e1dd29601d2738fc56a1c127edd";
        sha256 = "sha256-hTwbJM0fXq1yO0NcqxU66gn/73Gu0R8s+B7ZDlttcw0=";
      };
    in "${corners}";
  };
}
