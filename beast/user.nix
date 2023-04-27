{ pkgs, misc, ... }: {
  # This file will never be modified by fleek
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors
  programs.librewolf.enable = true;
  targets.genericLinux.enable = true;
  xdg.enable = true;
 
}
