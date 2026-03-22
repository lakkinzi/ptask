#!/bin/sh

sess_name="lakk"

if tmux has-session -t $sess_name 2>/dev/null; then
  echo "Session $sess_name already exists. Attaching to it."
  tmux kill-session -t $sess_name
fi

#PLAN
tmux new-session -d -s $sess_name

tmux new-session -d -s $sess_name
tmux send-keys -t 1 "cd ~/prog/pros && make start" Enter

tmux rename-window pros

tmux new-window -t $sess_name: -n pros
tmux send-keys -t 1 "cd ~/prog/pros && nvim ." Enter

#DEVELOP
tmux new-window -t $sess_name: -n client
tmux send-keys -t 1 "cd ~/prog/pros/client" Enter
tmux send-keys -t 1 "nvim ." Enter

tmux new-window -t $sess_name: -n server
tmux send-keys -t 1 "cd ~/prog/pros/server" Enter
tmux send-keys -t 1 "nvim ." Enter

tmux attach-session -t $sess_name
