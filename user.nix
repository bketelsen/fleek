{ pkgs, misc, ... }: {
  # This file will never be modified by fleek
  # configs mentioned here must be listed in ~/fleek.yml #programs array or you will get errors
home.sessionVariables = {
  FLEEK_MANAGED= "1";
};

services.syncthing.enable = true;
services.syncthing.extraOptions = [
  "listenAddress=http://0.0.0.0:8443"
];
 
}
