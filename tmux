# use zsh
set-option -g default-shell /bin/bash

# don't rename windows on changing name or running command
set-option -g allow-rename off

# Status bar customization
set -g status-bg black
set -g status-fg white
set -g status-interval 5
set -g status-left-length 90
set -g status-right-length 60

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg green #base01

# Use vim keybindings in copy mode
setw -g mode-keys vi

# Setup 'v' to begin selection as in Vim
# Make sure you have run 'brew install reattach-to-user-namespace' as per https://robots.thoughtbot.com/tmux-copy-paste-on-os-x-a-better-future
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

# Managing splits shouldn't be such a pain
bind-key s split-window -h -c '#{pane_current_path}'
bind-key z split-window -v -c '#{pane_current_path}'
bind-key x kill-pane
bind-key c new-window

# Start window numbering at 1
set-option -g base-index 1
set-window-option -g pane-base-index 1
bind-key n next-window 
bind-key p previous-window

# Window navigation
unbind l
set-option -g prefix C-a
bind-key C-a last-window

# Pane navigation like Vim
bind-key -n M-Down select-pane -D
bind-key -n M-Up select-pane -U
bind-key -n M-Left select-pane -L
bind-key -n M-Right select-pane -R

# Reload with r
bind-key r source-file ~/.tmux.conf \; display "Config Reloaded!"

# Mouse works as expected
set -g mouse on

# Allows for faster key repetition
set -s escape-time 0

