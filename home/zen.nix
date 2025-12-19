{...}: {
  programs.zen-browser = {
    enable = true;
    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      GenerativeAI = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };
}
