{...}: {
  services.swaync = {
    enable = true;

    style = ''
      .notification {
        padding: 10px;
        border-radius: 10px;
        background: rgba(32, 23, 23, 0.85);
        border: 4px solid #8d7091;
        color: #d7d7d5;
      }

    '';
  };
}
