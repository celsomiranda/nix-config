{ pkgs, lib, ... }: {
  home.packages = with pkgs; [
    bat 
    ripgrep 
    fd 
    exa
    ];

  programs.zsh.shellAliases.cat = "bat";

  programs = {
    bat = {
      enable = true;

      config = {
        paging = "never";
        style = lib.concatStringsSep "," [ "numbers" ];
        tabs = "4";
        theme = "Monokai Extended";
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
      enableBashIntegration = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
      historyWidgetOptions = [ "--no-multi" ];
    };
  };
}
