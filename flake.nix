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
    zen-browser.url = "github:ch4og/zen-browser-flake";
    nixvim = {
        url = "github:nix-community/nixvim";
        # If using a stable channel you can use `url = "github:nix-community/nixvim/nixos-<version>"`
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-stable, home-manager, nixvim, ... }:
  {
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
    	};
      modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.aqua = import ./home.nix;
	          home-manager.extraSpecialArgs = {
	  	          pkgs-stable = import nixpkgs-stable {
	                  inherit system;
	                  config.allowUnfree = true;
	                  };
                inherit nixvim;        
	          };
          }
	        inputs.minegrub-world-sel-theme.nixosModules.default
          inputs.spicetify-nix.nixosModules.default
        ];
      };
    };
  };
}
