{
  description = "Fleek Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    fleek.url = "github:nix-community/home-manager";
    fleek.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, fleek, ... }@inputs: {

    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {
    
      "brianjk@f84d89911e5d.ant.amazon.com" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        home.packages = [ fleek.packages.aarch64-darwin.default ];

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
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
        extraSpecialArgs = { inherit inputs; }; # Pass flake inputs to our config
        home.packages = [ fleek.packages.x86_64-linux.default ];

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
  };
}
