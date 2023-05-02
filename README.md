# Fleek Configuration
nix home-manager configs created by [fleek](https://github.com/ublue-os/fleek)

## Reference

[home-manager](https://nix-community.github.io/home-manager/)
[home-manager options](https://nix-community.github.io/home-manager/options.html)

## Usage

Aliases were added to the config to make it easier to use. To use them, run the following commands:

```bash
# To change into the fleek generated home-manager directory
$ fleeks
# To apply the configuration
$ apply-{hostname}
```

Your actual aliases are listed below:
    bluefin = "cd ~/projects/ublue/bluefin";

    cdfleek = "cd ~/projects/ublue/fleek";

    fleeks = "cd ~/.local/share/fleek";

    gcb = "git checkout -b";

    gitmain = "git checkout main && git pull";

    projects = "cd ~/projects";

    ublue = "cd ~/projects/ublue";
