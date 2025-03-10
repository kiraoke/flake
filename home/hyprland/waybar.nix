{userpath, ...}: {
  home.file.".config/waybar/colors-waybar.css".source = ../../dots/colors-waybar.css;

  programs.waybar = {
    enable = true;

    style = ''

        /* `otf-font-awesome` is required to be installed for icons */

      @import '${userpath}.config/waybar/colors-waybar.css';
      @import url("${userpath}.cache/wal/colors-waybar.css");
      *{
      font-family: Material Design Icons, IBM Plex Mono, Iosevka Nerd Font;
        font-size: 19px;
      }

      window#waybar {
        background-color: transparent;
        color: #ffffff;
        transition-property: background-color;
        transition-duration: 0.5s;
        border: none;
      }

      window#waybar.hidden {
        opacity: 0.1;
      }

      #window {
        color: #64727d;
      }

      #clock,
      #cpu,
      #memory,
      #custom-media,
      #tray,
      #mode,
      #custom-lock,
      #workspaces,
      #idle_inhibitor,
      #custom-power-menu,
      #custom-launcher,
      #custom-spotify,
      #custom-weather,
      #custom-weather.severe,
      #custom-weather.sunnyDay,
      #custom-weather.clearNight,
      #custom-weather.cloudyFoggyDay,
      #custom-weather.cloudyFoggyNight,
      #custom-weather.rainyDay,
      #custom-weather.rainyNight,
      #custom-weather.showyIcyDay,
      #custom-weather.snowyIcyNight,
      #custom-weather.default {
        color: #e5e5e5;
        border-radius: 6px;
        padding: 2px 10px;
        background-color: #252733;
        border-radius: 8px;
        font-size: 15px;

        margin-left: 4px;
        margin-right: 4px;

        margin-top: 5px;
        margin-bottom: 3px;
      }

      #cpu {
      	background-color: @color0;
        color: @color13;
      }

      #memory {
        	background-color: @color0;
        color: @color13;

      }

      #workspaces button {
        	background-color: @color0;
        color: @color13;
      box-shadow: none;
       margin-left: 3px;
       margin-right: 3px;

        padding-right: 4px;
        padding-left: 4px;


        transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
      }

      #workspaces button.active {
        color: @color0;
        background-color: @color13;
        padding-left: 8px;
        padding-right: 8px;
        margin-left: 5px;
        margin-right: 5px;
        transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
      }

      /* If workspaces is the leftmost module, omit left margin
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }
       If workspaces is the rightmost module, omit right margin
      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }*/

      #custom-launcher {
        margin-left: 12px;

        padding-right: 20px;
        padding-left: 14px;

        font-size: 22px;

        	background-color: @color0;
        color: @color13;


        margin-top: 8.5px;
        margin-bottom: 8.5px;
      }

      #backlight,
      #battery,
      #pulseaudio,
      #network {
        	background-color: @color0;
        color: @color13;

        padding: 0em 2em;

        font-size: 20px;

        padding-left: 7.5px;
        padding-right: 7.5px;

        padding-top: 3px;
        padding-bottom: 3px;

        margin-top: 7px;
        margin-bottom: 7px;

        font-size: 20px;
      }

      #pulseaudio {
        	background-color: @color0;
        color: @color13;

        padding-left: 9px;
        font-size: 22px;
      }

      #pulseaudio.muted {
        color: #fb958b;
        padding-left: 9px;
        font-size: 22px;
      }

      #backlight {
        	background-color: @color0;
        color: @color13;

        padding-right: 5px;
        padding-left: 8px;
        font-size: 21.2px;
      }

      #network {
        padding-left: 0.2em;
        	background-color: @color0;
        color: @color13;

        border-radius: 8px 0px 0px 8px;
        padding-left: 12px;
        padding-right: 14px;
        font-size: 20px;
      }

      #network.disconnected {
        color: #fb958b;
      }

      #battery {
        	background-color: @color0;
        color: @color13;

        border-radius: 0px 8px 8px 0px;
        padding-right: 2px;
        font-size: 22px;
      }

      #battery.critical,
      #battery.warning,
      #battery.full,
      #battery.plugged {
        	background-color: @color0;
        color: @color13;

        padding-left: 6px;
        padding-right: 12px;
        font-size: 22px;
      }

      #battery.charging {
        font-size: 18px;
        padding-right: 13px;
        padding-left: 4px;
      }

      #battery.full,
      #battery.plugged {
        font-size: 22.5px;
        padding-right: 10px;
      }

      @keyframes blink {
        to {
          background-color: rgba(30, 34, 42, 0.5);
          color: #abb2bf;
        }
      }

      #battery.warning {
        color: #ecd3a0;
      }

      #battery.critical:not(.charging) {
        color: #fb958b;
      }

      #custom-lock {
        color: #ecd3a0;
        padding: 0 15px 0 15px;
        margin-left: 7px;
        margin-top: 7px;
        margin-bottom: 7px;
      }

      #clock {
        	background-color: @color0;
        color: @color13;

        font-family: Iosevka Nerd Font;
        font-weight: bold;
        margin-top: 7px;
        margin-bottom: 7px;
      }

      #custom-power-menu {
        background-color: @color0;
        color: @color13;

        margin-right: 7px;
        border-radius: 8px;
        padding: 0 6px 0 9px;
        margin-top: 7px;
        margin-bottom: 7px;
      }

      tooltip {
        font-family: Iosevka Nerd Font;
        border-radius: 15px;
        padding: 15px;
        background-color: #1f232b;
      }

      tooltip label {
        font-family: Iosevka Nerd Font;
        padding: 5px;
      }

      label:focus {
        background-color: #1f232b;
      }

      #tray {
        background-color: @color0;
        margin-right: 8px;
        margin-top: 7px;
        margin-bottom: 7px;
        font-size: 30px;
      }


      #idle_inhibitor {
        background-color: #242933;
      }

      #idle_inhibitor.activated {
        background-color: #ecf0f1;
        color: #2d3436;
      }

      #custom-spotify {
        	background-color: @color0;
        color: @color13;



      }

      #custom-weather {
        font-family: Iosevka Nerd Font;
        font-size: 19px;
        color: #8a909e;
      }

      #custom-weather.severe {
        color: #eb937d;
      }

      #custom-weather.sunnyDay {
        color: #c2ca76;
      }

      #custom-weather.clearNight {
        color: #cad3f5;
      }

      #custom-weather.cloudyFoggyDay,
      #custom-weather.cloudyFoggyNight {
        color: #c2ddda;
      }

      #custom-weather.rainyDay,
      #custom-weather.rainyNight {
        color: #5aaca5;
      }

      #custom-weather.showyIcyDay,
      #custom-weather.snowyIcyNight {
        color: #d6e7e5;
      }

      #custom-weather.default {
        color: #dbd9d8;
      }

    '';

    settings = [
      {
        height = 25;
        layer = "top";
        "modules-left" = ["custom/launcher" "cpu" "memory" "hyprland/workspaces"];
        "modules-right" = [
          "custom/spotify"
          "tray"
          "network"
          "pulseaudio"
          "backlight"
          "battery"
          "clock"
        ];

        "hyprland/workspaces" = {
          "disable-scroll" = true;
          "all-outputs" = true;
          "on-click" = "activate";
          "persistent_workspaces" = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
            "6" = [];
            "7" = [];
            "8" = [];
            "9" = [];
            "10" = [];
          };
        };

        "hyprland/window" = {format = "{}";};

        tray = {
          "icon-size" = 25;
          spacing = 10;
        };
      }
    ];
  };
}
