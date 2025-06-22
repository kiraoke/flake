{...}: {
  services.swaync = {
    enable = true;

    style = ''
      .notification {
        padding: 10px;
        border-radius: 10px;
        background: rgba(32, 23, 23, 0.75);
        border: 4px solid #8d7091;
        color: #d7d7d5;
      }
    '';

    settings = {
      positionX = "right";
      positionY = "top";
      layer = "overlay";
      control-center-layer = "top";
      layer-shell = true;
      cssPriority = "application";
      control-center-margin-top = 0;
      control-center-margin-bottom = 0;
      control-center-margin-right = 0;
      control-center-margin-left = 0;
      notification-2fa-action = true;
      notification-inline-replies = false;
      notification-icon-size = 64;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
    };
  };
}
