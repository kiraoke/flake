{pkgs-stable, ...}: {
  programs.nixvim.plugins.copilot-vim = {
    enable = true;
    package = pkgs-stable.vimPlugins.copilot-vim;
  };
}
