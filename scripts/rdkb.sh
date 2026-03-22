#!/bin/sh

sess_name="lakk"
root="~/prog/rdkb"

if tmux has-session -t $sess_name 2>/dev/null; then
  echo "Session $sess_name already exists. Attaching to it."
  tmux kill-session -t $sess_name
fi

tmux new-session -d -s $sess_name
tmux send-keys -t 1 "cd ${root} && make start" Enter
tmux rename-window r

tmux new-window -t $sess_name: -n s
tmux send-keys -t 1 "cd ${root} && nvim ." Enter

tmux new-window -t $sess_name: -n l_c
tmux send-keys -t 1 "cd ${root}/leiter/client && nvim ." Enter

tmux new-window -t $sess_name: -n l_s
tmux send-keys -t 1 "cd ${root}/leiter/server && nvim ." Enter

tmux new-window -t $sess_name: -n hr_c
tmux send-keys -t 1 "cd ${root}/hr/client && nvim ." Enter

tmux new-window -t $sess_name: -n hr_s
tmux send-keys -t 1 "cd ${root}/hr/server && nvim ." Enter

tmux new-window -t $sess_name: -n p_c
tmux send-keys -t 1 "cd ${root}/portal/client && nvim ." Enter

tmux new-window -t $sess_name: -n p_s
tmux send-keys -t 1 "cd ${root}/portal/server && nvim ." Enter

tmux new-window -t $sess_name: -n f_c
tmux send-keys -t 1 "cd ${root}/food/client && nvim ." Enter

tmux new-window -t $sess_name: -n f_s
tmux send-keys -t 1 "cd ${root}/food/server && nvim ." Enter

tmux new-window -t $sess_name: -n m_c
tmux send-keys -t 1 "cd ${root}/map/client && nvim ." Enter

tmux new-window -t $sess_name: -n m_s
tmux send-keys -t 1 "cd ${root}/map/server && nvim ." Enter

tmux attach-session -t $sess_name
