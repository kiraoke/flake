{...}: {
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;

    pulse.enable = true;
    audio.enable = true;

    alsa = {
      enable = true;
      support32Bit = true;
    };

    jack.enable = true;

    wireplumber.enable = true;

    extraConfig.pipewire = {
          "default.clock.rate" = 48000;
          "default.clock.quantum" = 2048;
          "default.clock.min-quantum" = 2048;
          "default.clock.max-quantum" = 8192;
      };
  };
}
