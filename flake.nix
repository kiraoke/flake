{
  description = "A simple NixOS flake";

  inputs = {
    # NixOS official package source, using the nixos-24.05 branch here
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    minegrub-world-sel-theme.url = "github:Lxtharia/minegrub-world-sel-theme";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixvim = {
      url = "github:nix-community/nixvim";
      # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
      inputs.nixpkgs.follows = "nixpkgs";
    };
    oskars-dotfiles = {
      url = "github:oskardotglobal/.dotfiles/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:aylur/ags";
    hyprland.url = "github:hyprwm/Hyprland/v0.46.1";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    nixvim,
    oskars-dotfiles,
    ...
  }: {
    # Please replace my-nixos with your hostname
    nixosConfigurations = {
      hoshino = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;

          pkgs-stable = import nixpkgs-stable {
            # Refer to the `system` parameter from
            # the outer scope recursively
            inherit system;
            # To use Chrome, we need to allow the
            # installation of non-free software.
            config.allowUnfree = true;
          };

          username = "aqua";
          userpath = "/home/aqua/";
        };
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.sharedModules = [nixvim.homeManagerModules.nixvim];
            home-manager.users.aqua = import ./home.nix;
            home-manager.extraSpecialArgs = {
              pkgs-stable = import nixpkgs-stable {
                inherit system;
                config.allowUnfree = true;
              };

              username = "aqua";
              userpath = "/home/aqua/";

              inherit inputs;
            };
          }
          {nixpkgs.overlays = [oskars-dotfiles.overlays.spotx];}
          inputs.minegrub-world-sel-theme.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
        ];
      };
    };
  };
}
