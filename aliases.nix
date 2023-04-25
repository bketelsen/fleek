{ pkgs, misc, ... }: {
   home.shellAliases = {
    bluefin = "cd ~/projects/ublue/bluefin";
    
    cdfleek = "cd ~/projects/ublue/fleek";
    
    fleeks = "cd ~/.local/share/fleek";
    
    gcb = "git checkout -b";
    
    gitmain = "git checkout main && git pull";
    
    projects = "cd ~/projects";
    
    ublue = "cd ~/projects/ublue";
    
    # bat --plain for unformatted cat
    catp = "bat -P";
    
    # replace cat with bat
    cat = "bat";
    };
}
