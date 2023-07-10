{ pkgs, ...}: {

  home.packages = [
  pkgs.unzip
  pkgs.wget
  ];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
