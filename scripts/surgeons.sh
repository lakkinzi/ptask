#!/bin/sh

sess_name="lakk"

if tmux has-session -t $sess_name 2>/dev/null; then
  echo "Session $sess_name already exists. Attaching to it."
  tmux kill-session -t $sess_name
fi

#PLAN
tmux new-session -d -s $sess_name
tmux send-keys -t 1 "cd ~/plan" Enter
tmux send-keys -t 1 "nvim -n -c \"ex stack | new read | vnew mus | vnew vid | wincmd k | vnew heap \"" Enter
tmux rename-window plan

#DEVELOP
tmux new-window -t $sess_name: -n client
tmux send-keys -t 1 "cd ~/prog/surgeons/client" Enter
tmux send-keys -t 1 "nvim ." Enter

tmux new-window -t $sess_name: -n server
tmux send-keys -t 1 "cd ~/prog/surgeons/server" Enter
tmux send-keys -t 1 "nvim ." Enter

tmux new-window -t $sess_name: -n proc
tmux send-keys -t 1 "cd ~/prog/surgeons/client" Enter
tmux send-keys -t 1 "make run" Enter
tmux split-window -h

tmux send-keys -t 2 "cd ~/prog/surgeons/server" Enter
tmux send-keys -t 2 "make run" Enter

tmux new-window -t $sess_name: -n logs
tmux send-keys -t 1 "cd ~/prog/surgeons" Enter

tmux new-window -t $sess_name: -n sprof
tmux send-keys -t 1 "cd ~/prog/sprof" Enter
tmux send-keys -t 1 "nvim ." Enter

tmux new-window -t $sess_name: -n sprob
tmux send-keys -t 1 "cd ~/prog/sprob" Enter
tmux send-keys -t 1 "nvim ." Enter

tmux attach-session -t $sess_name
