{ pkgs, misc, config, ... }: {
    home.username = config.fleek.systems.ghanima.user.bjk.username;
    home.homeDirectory = "/home/bjk";
    programs.git = {
        enable = true;
        aliases = {
            pushall = "!git remote | xargs -L1 git push --all";
            graph = "log --decorate --oneline --graph";
            add-nowhitespace = "!git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero -";
        };
        userName = config.fleek.systems.ghanima.user.bjk.name;
        userEmail =config.fleek.systems.ghanima.user.bjk.email;
        extraConfig = {
            feature.manyFiles = true;
            init.defaultBranch = "main";
            gpg.format = "ssh";
        };

        signing = {
            key = config.fleek.systems.ghanima.user.bjk.ssh_private_key_file;
            signByDefault = builtins.stringLength config.fleek.systems.ghanima.user.bjk.ssh_private_key_file > 0;
        };

        lfs.enable = true;
        ignores = [ ".direnv" "result" ];
  };
}
