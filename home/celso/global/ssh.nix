{ config, lib, ... }:
let home = config.home.homeDirectory;
in {
  programs.ssh = {
    enable = true;

    compression = true;
    controlPath = "${home}/.ssh/master-%r@%n:%p";
    hashKnownHosts = false;
    serverAliveCountMax = 3;
    serverAliveInterval = 10;
    userKnownHostsFile = "${home}/.ssh/known_hosts";

    extraConfig = ''
      AddKeysToAgent yes
      ConnectionAttempts 3
      IdentityFile ${home}/.ssh/id_rsa
      NumberOfPasswordPrompts 3
      PubkeyAuthentication yes
    '';

    matchBlocks = {
      "github.com" = {
        user = "git";
        identityFile = "${home}/.ssh/github_key";
      };

      "gitlab.iscte-iul.pt" = {
        user = "git";
        identityFile = "${home}/.ssh/gitlab_key";
      };
    };
  };
}
