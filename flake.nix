{
  description = "Fleek Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";

    fleek.url = "github:nix-community/home-manager";
    fleek.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, flake-utils, fleek, ... }@inputs: 
        flake-utils.lib.eachDefaultSystem (system:
      let
        bob = nixpkgs.legacyPackages.${system};
      in
        {
    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
    

      "brianjk@f84d89911e5d.ant.amazon.com" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        home.packages = [ fleek.packages.${system}.default ];

        modules = [ 
          ./home.nix 
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./f84d89911e5d.ant.amazon.com/f84d89911e5d.ant.amazon.com.nix
          ./f84d89911e5d.ant.amazon.com/user.nix
        ];
      };
      

      "bjk@beast" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system}; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        home.packages = [ fleek.packages.${system}.default ];

        modules = [ 
          ./home.nix 
          ./path.nix
          ./shell.nix
          ./user.nix
          ./aliases.nix
          ./programs.nix
          # Host Specific configs
          ./beast/beast.nix
          ./beast/user.nix
        ];
      };
      
    
    };
    });
  
}
