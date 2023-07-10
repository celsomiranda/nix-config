{ pkgs, ... }: {
  programs = {
    fzf.tmux.enableShellIntegration = true;

    zsh = {
      shellAliases = {
        attach = "tmux attach-session -t 'default' || tmux new-session -s 'default'";
        clear = "clear && tmux clear-history 2> /dev/null";
      };

      initExtra = ''
        if [ "$TMUX" = ''' ]; then
          if [ "$XDG_SESSION_TYPE" = 'tty' ]; then
            tmux attach-session -t "$(basename $(tty))" || tmux new-session -s "$(basename $(tty))"
          elif [ "$TERM_PROGRAM" != 'vscode' ] && [ "$TERMINAL_EMULATOR" != 'JetBrains-JediTerm' ]; then
            tmux attach-session -t 'default' || tmux new-session -s 'default'
          fi
        fi
      '';
    };

    tmux = {
      enable = true;

      shortcut = "a";
      keyMode = "emacs";
      mouse = true;
      clock24 = true;
      historyLimit = 10 * 1000;
      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "screen-256color";

      extraConfig = ''
        unbind %
        bind | split-window -h
        bind | split-window -h -c "#{pane_current_path}"

        unbind '"'
        bind - split-window -v
        bind '-' split-window -v -c "#{pane_current_path}"

        set -g message-command-style bg=black,fg=green
        set -g message-style bg=green,fg=black
        set -g mode-style 'reverse'
        set -g status-fg black
        set -g status-interval 1
        set -g status-right ""
      '';
    };
  };
}
