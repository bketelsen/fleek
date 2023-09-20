{ pkgs, misc, ... }: {
  # DO NOT EDIT: This file is managed by fleek. Manual changes will be overwritten.
    home.username = "brianjk";
    home.homeDirectory = "/Users/brianjk";
    programs.git = {
        enable = true;
        aliases = {
            pushall = "!git remote | xargs -L1 git push --all";
            graph = "log --decorate --oneline --graph";
            add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
        };
        userName = "Brian Ketelsen";
        userEmail = "bketelsen@gmail.com";
        extraConfig = {
            feature.manyFiles = true;
            init.defaultBranch = "main";
            gpg.format = "ssh";
        };

        signing = {
            key = "~/.ssh/id_ecdsa";
            signByDefault = builtins.stringLength "~/.ssh/id_ecdsa" > 0;
        };

        lfs.enable = true;
        ignores = [ ".direnv" "result" ];
  };
  
}
