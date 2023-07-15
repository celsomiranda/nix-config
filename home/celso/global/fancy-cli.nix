{ pkgs, lib, ... }: {
  home.packages = [ pkgs.bat pkgs.ripgrep pkgs.fd pkgs.exa ];

  programs.zsh.shellAliases.cat = "bat";

  programs = {
    bat = {
      enable = true;

      config = {
        paging = "never";
        style = lib.concatStringsSep "," [ "numbers" ];
        tabs = "4";
        theme = "ansi";
      };
    };

    exa = {
      enable = true;
      enableAliases = true;
      git = true;
    };

    ripgrep.enable = true;

    fzf = {
      enable = true;
<<<<<<< HEAD

      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;

=======
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
>>>>>>> 8e5793d (initial apps refactoring)
      historyWidgetOptions = [ "--no-multi" ];
    };
  };
}
