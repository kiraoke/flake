{...}: {
    programs.fuzzel.enable = true;
    home.file.".config/fuzzel".source = ../dots/fuzzel;

    programs.rofi.enable = true;    
    home.file.".config/rofi".source = ../dots/rofi;
}
