{ 
  programs.fzf = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableZshIntegration = true;

    historyWidgetOptions = [ "--no-multi" ];
  };
}
