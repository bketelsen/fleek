{ config, outputs,pkgs, misc, ... }: {
    imports = [
    # If you want to use modules your own flake exports (from modules/home-manager):
    outputs.homeManagerModules.fleek

    # Or modules exported from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModules.default

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
  ];
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
  nixpkgs = {
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = (_: true);
      
    };
  };
  fleek = {
    bling = "high";
  };
  
  # managed by fleek, modify ~/.fleek.yml to change installed packages
  
  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  home.packages = [
    # user selected packages
    pkgs.go
    pkgs.gopls
    pkgs.go-tools
    pkgs.golangci-lint
    pkgs.gomodifytags
    pkgs.gotests
    pkgs.impl
    pkgs.gcc
    pkgs.nodejs
    pkgs.yarn
    pkgs.rustup
    pkgs.vhs
    pkgs.rnix-lsp
    pkgs.duf
    pkgs.ruby_3_2

    # Fleek Bling

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];
  fonts.fontconfig.enable = true; 
  home.stateVersion =
    "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
  programs.home-manager.enable = true;
}
