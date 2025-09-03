{...}: {
  # for pipewire
  home.file.".config/pipewire/pipewire.conf.d/hires.conf".source = ../dots/pipewire.conf;

  home.file.".config/wireplumber/wireplumber.conf.d/50-also-config.conf".text = ''
    	monitor.alsa.rules = [
      {
        matches = [
          # This matches the value of the 'node.name' property of the node.
          {
            node.name = "~alsa_output.*"
          }
        ]
        actions = {
          # Apply all the desired node specific settings here.
          update-props = {
            api.alsa.period-size   = 1024
            api.alsa.headroom      = 8192
          }
        }
      }
    ]
  '';
}
