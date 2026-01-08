#!/bin/bash

session_name="example_session"

if ! tmux has-session -t "$session_name" 2>/dev/null; then
  tmux new-session -d -s "$session_name" -n "window1" -c ~/init_dir/
  tmux send-keys -t "$session_name:1" "init_command" C-m

  tmux new-window -t "$session_name" -n "window2" -c ~/init_dir/sub_dir/
  tmux send-keys -t "$session_name:2" "echo 'bob'" C-m

  tmux new-window -t "$session_name" -n "window3" -c ~/rustlings/
  #tmux send-keys -t "$session_name:2" "" C-m
fi

tmux attach-session -t "$session_name"
