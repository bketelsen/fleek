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
    users = {
      bjk = {
        name = "Brian Ketelsen";
        email = "bketelsen@gmail.com";
        ssh_private_key_file = "~/.ssh/id_rsa";
        ssh_public_key_file = "~/.ssh/id_rsa.pub";
        username = "bjk";
      };
    };
    systems = {
      ghanima = {
        arch = "x86_64";
        hostname = "ghanima";
        os = "linux";
        user = {
          bjk = config.fleek.users.bjk;
        };
      };
    };
    packages = [
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
    ];
  };

  # managed by fleek, modify ~/.fleek.yml to change installed packages

  # packages are just installed (no configuration applied)
  # programs are installed and configuration applied to dotfiles
  home.packages = [

    # Fleek Bling

    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

}
