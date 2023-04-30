{
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  description = "Fleek Configuration";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Fleek
    fleek.url = "github:ublue-os/fleek";

  };

  outputs = { self, nixpkgs, home-manager, fleek, ... }@inputs:
  let
        inherit (self) outputs;
  in
  {
    homeManagerModules = import ./modules/home-manager;



    # Available through 'home-manager --flake .#your-username@your-hostname'
    homeConfigurations = {

      "brianjk@f84d89911e5d.ant.amazon.com" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
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
          # self-manage fleek
          {
            home.packages = [
              fleek.packages.aarch64-darwin.default
            ];
          }

        ];
      };

      "bjk@beast" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home.nix
          #./path.nix
          #./shell.nix
          ./user.nix
          ./aliases.nix
          #./programs.nix
          # Host Specific configs
          ./beast/beast.nix
          ./beast/user.nix
          # self-manage fleek
          {
            home.packages = [
              fleek.packages.x86_64-linux.default
            ];
          }

        ];
      };
      "bjk@ghanima" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
        modules = [
          ./home.nix
          #./path.nix
          #./shell.nix
          ./user.nix
          ./aliases.nix
          #./programs.nix
          # Host Specific configs
          ./ghanima/ghanima.nix
          ./ghanima/user.nix
          # self-manage fleek
          {
            home.packages = [
              fleek.packages.x86_64-linux.default
            ];
          }

        ];
      };
    };
  };
}
