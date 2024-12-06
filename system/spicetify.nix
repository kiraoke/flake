{
  pkgs,
  inputs,
  ...
}: {
  programs.spicetify = let
    spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
  in {
    spotifyPackage = pkgs.spotify;
    enable = true;
    enabledExtensions = [
      spicePkgs.extensions.adblock
      spicePkgs.extensions.beautifulLyrics
      {
        name = "romanji.js";
        src = pkgs.fetchFromGitHub {
          owner = "ingineous";
          repo = "romanji";
          rev = "c3dba44f50314005159c7e37842ed0c2ab117dac";
          hash = "sha256-wz1ft9nhX8ND4eJhsjB7L64MpAscccS2QbHB0Cim8dw=";
        };
      }
      {
        name = "romaja.js";
        src = pkgs.fetchFromGitHub {
          owner = "ingineous";
          repo = "romaja";
          rev = "88fcbf91cb6afa36b140c7b3cfd22276dc9dca7b";
          hash = "sha256-UisN2lUZf3/NJyagPuLNvQX4SDZmT6ghcieR2G+NsNY=";
        };
      }
      {
        name = "waveform.js";
        src = pkgs.fetchFromGitHub {
          owner = "SPOTLAB-Live";
          repo = "Spicetify-waveform";
          rev = "89fa8a6e29258984bc296790e6f41ee017e87c71";
          hash = "sha256-LOOtdlnpKRE/D95hbuk8vTtFUsA+nUtmsKTiQiy2s7w=";
        };
      }
    ];
    enabledCustomApps = with spicePkgs.apps; [marketplace];
    theme = {
      name = "Galaxy";
      src = pkgs.fetchFromGitHub {
        owner = "harbassan";
        repo = "spicetify-galaxy";
        rev = "45467bad47526c49290a9273dca02085b9a55842";
        hash = "sha256-5MPmUznHx5OFUsF3lbrBs3QDdUv8EO2srNywxy1S3LE=";
      };
      injectCss = true;
      injectThemeJs = true;
      replaceColors = true;
      homeConfig = true;
      overwriteAssets = true;
      additonalCss = "";
    };
  };
}
