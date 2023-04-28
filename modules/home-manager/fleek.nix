{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.fleek;
in
{
  options.fleek = {
    bling = mkOption {
      type = types.enum [ "none" "low" "default" "high" ];
      default = "low";
    };
    path = mkOption {
      type = types.listOf types.str;
      default = [ ];
    };

  };

  config = mkMerge
    [
      # Unconditional stuff.
      {
        home.packages = with pkgs; [
          git
        ];
        home.sessionPath = cfg.path;
        programs.zsh = {
          profileExtra = "[ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh";
          enableCompletion = true;
          enable = true;
        };
        fonts.fontconfig.enable = true;
        home.stateVersion =
          "22.11"; # To figure this out (in-case it changes) you can comment out the line and see what version it expected.
        programs.home-manager.enable = true;
        nixpkgs = {
          # Configure your nixpkgs instance
          config = {
            # Disable if you don't want unfree packages

            allowUnfree = true;
            # Workaround for https://github.com/nix-community/home-manager/issues/2942
            allowUnfreePredicate = (_: true);

          };
        };
      }
      (mkIf (builtins.elem cfg.bling [ "high" "default" "low" ]) {
        home.packages = with pkgs; [
          htop
          github-cli
          glab
        ];
      })
      (mkIf (builtins.elem cfg.bling [ "high" "default" ]) {
        home.packages = with pkgs; [
          fzf
          ripgrep
          vscode
        ];
      })
      (mkIf (builtins.elem cfg.bling [ "high" ]) {
        home.packages = with pkgs; [
          lazygit
          jq
          yq
          neovim
          neofetch
          btop
          cheat
        ];
        programs.exa = {
          enable = true;
          enableAliases = true;
          extraOptions = [
            "--group-directories-first"
            "--header"
          ];
        };
        programs.bat = {
          enable = true;
          config = {
            theme = "TwoDark";
          };
        };
        programs.atuin.enable = true;
        programs.zoxide.enable = true;
        programs.direnv.enable = true;
        programs.starship.enable = true;
      })
    ];

}
