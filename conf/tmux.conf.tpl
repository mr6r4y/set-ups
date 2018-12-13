# Remap prefix to screen
set -g prefix C-a
bind C-a send-prefix
unbind C-b

# Quality of life stuff
set -g history-limit 10000
set -g allow-rename off

# Join windows
bind-key j command-prompt -p "join pane from:" "join-pane -s '%%'"
bind-key s command-prompt -p "send pane to:" "join-pane -t '%%'"

# Search Mode VI (default is emacs)
set-window-option -g mode-keys vi

# Logging
run-shell {{REPODIR}}/tmux-logging/logging.tmux

# Fix issue of colors when in Vim
set -g default-terminal "screen-256color"
