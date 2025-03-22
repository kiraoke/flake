{...}: {
    programs.fuzzel.enable = true;
    home.file.".config/fuzzel/fuzzel.ini".source = ../dots/fuzzel/fuzzel.ini; 
    home.file.".config/fuzzel/fuzzel-default.ini".source = ../dots/fuzzel/fuzzel-default.ini; 
    home.file.".config/fuzzel/fuzzel-light.ini".source = ../dots/fuzzel/fuzzel-light.ini; 
    home.file.".config/fuzzel/fuzzel-clip.ini".source = ../dots/fuzzel/fuzzel-clip.ini; 
    home.file.".config/fuzzel/fuzzel-clip-light.ini".source = ../dots/fuzzel/fuzzel-clip-light.ini; 
    home.file.".config/fuzzel/clipboard-fuzzel.sh".source = ../dots/fuzzel/clipboard-fuzzel.sh; 
}
