#!/bin/bash

SESSION="monitor"

# Start tmux session
tmux new-session -d -s $SESSION

# Pane 0: Left side (70% width)
tmux send-keys -t $SESSION 'cd ~/mysh/checktemp && watch -n 5 ./plot_sensors_cli.sh' C-m

# Split right side (30% width)
tmux split-window -h -t $SESSION

# On right side, top pane (Pane 1)
tmux send-keys -t $SESSION:0.1 'watch -n 2 sensors' C-m

# Split bottom of right side (Pane 2) - 30% height
tmux split-window -v -t $SESSION:0.1
tmux send-keys -t $SESSION:0.2 'htop' C-m

# Resize layout:
tmux select-pane -t $SESSION:0.0
tmux resize-pane -R 30   # Increase left width (Pane 0)

tmux select-pane -t $SESSION:0.1
tmux resize-pane -D 7   # Shrink top-right to 70%

# Attach session
tmux select-pane -t $SESSION:0.0
tmux attach -t $SESSION
