{ config, outputs, pkgs, misc, ... }: {
  imports = [
    outputs.homeManagerModules.fleek
  ];
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.

  fleek = {
    bling = "high";
    path = [
      "$HOME/bin"
      "$HOME/.local/bin"
      "$HOME/go/bin"
    ];
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

}
