{ pkgs, ...}: {

  home.packages = [
  pkgs.unzip
  pkgs.wget
  pkgs.fd
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
