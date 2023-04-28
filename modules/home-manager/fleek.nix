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

  };

  config = mkMerge
    [
      # Unconditional stuff.
      {
        home.packages = with pkgs; [
          git
        ];
      }
      (mkIf (builtins.elem cfg.bling ["high" "default" "low"]) {
        home.packages = with pkgs; [
          htop
          github-cli
          glab
        ];
      })
      (mkIf (builtins.elem cfg.bling ["high" "default"]) {
        home.packages = with pkgs; [
          fzf
          ripgrep
          vscode
        ];
      })
      (mkIf (builtins.elem cfg.bling ["high"]) {
        home.packages = with pkgs; [
          lazygit
          jq
          yq
          neovim
          neofetch
          btop
          cheat
        ];
      })
    ];

}
