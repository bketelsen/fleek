{ pkgs, misc, lib, ... }: {
  # This file will never be modified by fleek
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors
home.sessionVariables = {
  FLEEK_MANAGED= "1";
  EDITOR = "nvim";
  NODE_PATH="~/.npm-packages/lib/node_modules";
};

# set global npm home so `npm i --global` has a writable directory
home.file.".npmrc".text = ''
      prefix = ~/.npm-packages
'';
services.syncthing.enable = true;
services.syncthing.extraOptions = [
  "--gui-address=http://0.0.0.0:8384"
];

home.activation = {
  getAstroNvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    $DRY_RUN_CMD rm -rf $VERBOSE_ARG \
        $HOME/.config/nvim
    $DRY_RUN_CMD rm -rf $VERBOSE_ARG \
        $HOME/.local/share/nvim
    $DRY_RUN_CMD rm -rf $VERBOSE_ARG \
        $HOME/.local/state/nvim
    $DRY_RUN_CMD rm -rf $VERBOSE_ARG \
        $HOME/.cache/nvim
    $DRY_RUN_CMD ${pkgs.git}/bin/git clone --depth 1 \
      https://github.com/AstroNvim/AstroNvim \
      ~/.config/nvim
    
  '';
};

}
