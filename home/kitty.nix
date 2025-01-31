{...}: {
      # include ~/.cache/wal/colors-kitty.conf
  programs.kitty = {
    enable = true;
    extraConfig = ''
      font_family Noto Nerd Font
      italic_font auto
      bold_font auto
      bold_italic_font auto
      font_size 11.5
      background_opacity 0.9

       # -- window --
      window_margin_width 5 5
      window_resize_step_cells 5
      window_resize_step_lines 2
      confirm_os_window_close 0

      # -- misc settings --
      enable_audio_bell no
      force_ltr no
      detect_urls yes

      # -- map keys --
      map f1 launch --cwd=current
      map f2 launch --cwd=current --type=tab
    '';
  };

  home.file.".config/ghostty/config".source = ../dots/ghostty.conf;
}
