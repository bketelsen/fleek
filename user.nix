{ pkgs, misc, ... }: {
  # FEEL FREE TO EDIT: This file is NOT managed by fleek. 
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
