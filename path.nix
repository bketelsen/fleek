{ pkgs, misc, ... }: {
 home.sessionPath = [ 
    "$HOME/bin"
    "$HOME/.local/bin"
    "$HOME/go/bin"
 ];
}
