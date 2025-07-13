{userpath, ...}: let
  input_position = -340;
  right_position = 120;
  touch_label_position = input_position + 28;
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          path = "${userpath}/flake/assets/evangelion2x.png";

          blur_passes = 0;
          blur_size = 2;
          noise = 0;
          contrast = 0;
          brightness = 0;
          vibrancy = 0;
          vibrancy_darkness = "0.0";
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "450, 90";
          outline_thickness = 0;
          dots_size = 0.20;
          dots_spacing = 0.55;
          dots_center = true;
          dots_rounding = -1;
          inner_color = "rgba(30, 25, 27, 0)";
          font_color = "rgba(235, 235, 234, 0.75)";
          fade_on_empty = false;
          placeholder_text = "";
          hide_input = false;
          check_color = "rgba(30, 25, 27, 0)";
          fail_color = "rgba(172, 170, 175, 0)";
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "${toString right_position}, ${toString input_position}";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = "Touch Id or Enter Password";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 10;
          font_family = "SD Pro Display";
          position = "${toString right_position}, ${toString touch_label_position}";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
