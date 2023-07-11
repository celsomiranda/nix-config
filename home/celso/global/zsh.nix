{ pkgs, ... }: {
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10 * 1000;
      extended = true;
    };

    shellAliases = {
      ls = "ls --color=tty";
    };
  };
}
