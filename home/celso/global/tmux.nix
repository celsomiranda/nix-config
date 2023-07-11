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
      baseIndex = 1;
      escapeTime = 0;
      aggressiveResize = true;
      keyMode = "vi";
      mouse = true;
      clock24 = true;
      historyLimit = 10 * 1000;
      terminal = "screen-256color";

      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        {
          plugin = dracula;
          extraConfig = ''
            set -g @dracula-show-battery false
            set -g @dracula-show-powerline true
            set -g @dracula-refresh-rate 10
            set -g @dracula-show-fahrenheit false
          '';
        }
      ];

      extraConfig = ''
        unbind %
        bind | split-window -h
        bind | split-window -h -c "#{pane_current_path}"

        unbind '"'
        bind - split-window -v
        bind '-' split-window -v -c "#{pane_current_path}"
        
        set-option -sa terminal-features ',screen-256color:RGB'
      '';
    };
  };
}
