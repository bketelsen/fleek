{
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  description = "Fleek Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "https://flakehub.com/f/nix-community/home-manager/0.1.tar.gz";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Fleek
    fleek.url = "https://flakehub.com/f/ublue-os/fleek/*.tar.gz";

    # Overlays
    

  };

  outputs = { self, nixpkgs, home-manager, fleek, ... }@inputs: {
    
     packages.aarch64-darwin.fleek = fleek.packages.aarch64-darwin.default;
    
    # Available through 'home-manager --flake .#your-username@your-hostname'
    
    homeConfigurations = {
    
      "bjk@chapterhouse" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        modules = [
          ./home.nix 
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./chapterhouse/bjk.nix
          ./chapterhouse/custom.nix
          # self-manage fleek
          {
            home.packages = [
              fleek.packages.aarch64-darwin.default
            ];
          }
          ({
           nixpkgs.overlays = [];
          })

        ];
      };
      
    };
  };
}
