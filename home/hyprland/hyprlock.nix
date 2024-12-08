{...}: {
  programs.hyprlock = {
    enable = true;

    settings = {
      background = [
        {
          monitor = "";
          path = "~/Pictures/wallpapers/marima.jpg";
          color = "rgba(25, 20, 20, 1.0)";

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
          size = "400, 80";
          outline_thickness = 2;
          dots_size = 0.25;
          dots_spacing = 0.55;
          dots_center = true;
          dots_rounding = -1;
          outer_color = "rgb(236, 169, 158)";
          inner_color = "rgb(135, 27, 43)";
          font_color = "rgb(179, 206, 208)";
          fade_on_empty = false;
          placeholder_text = "";
          hide_input = false;
          check_color = "rgba(204, 136, 34, 0)";
          fail_color = "rgba(204, 34, 34, 0)";
          fail_text = "$FAIL <b>($ATTEMPTS)</b>";
          fail_transition = 300;
          capslock_color = -1;
          numlock_color = -1;
          bothlock_color = -1;
          invert_numlock = false;
          swap_font_color = false;
          position = "0, -270";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(data + "%A, %B %d")"'';
          color = "rgba(215, 130, 147, 0.75)";
          font_size = 80;
          font_family = "SF Pro Display Bold";
          position = "0, 400";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = ''cmd[update:1000] echo "$(date +"%k:%M")"'';
          color = "rgba(179, 206, 208, 0.75)";
          font_size = 140;
          font_family = "SF Pro Display Bold";
          position = "0, 253";
          halign = "center";
          valign = "center";
        }

        {
          monitor = "";
          text = "Touch Id or Enter Password";
          color = "rgba(242, 243, 244, 0.75)";
          font_size = 10;
          font_family = "SD Pro Display";
          position = "0, -242";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
