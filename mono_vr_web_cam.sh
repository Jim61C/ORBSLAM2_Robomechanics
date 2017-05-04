#!/bin/bash
SESSION=MONO_VR_WEB_CAM
tmux new-session -d -s $SESSION
tmux attach-session -t $SESSION

tmux split-window -h
tmux select-pane -t 0
tmux send-keys "roscore" C-m
#tmux send-keys "ssh kodlab@xrl3" C-m
sleep 2

tmux split-window -v
tmux select-pane -t 1
tmux send-keys "rosrun ORB_SLAM2 MonoAR Vocabulary/ORBvoc.txt Examples/Monocular/web_cam.yaml" C-m
# tmux send-keys "echo pane 1 after split-window -v " C-m
sleep 15

tmux select-pane -t 2
# tmux send-keys "echo right side " C-m
tmux send-keys "rosrun image_publisher image_publisher_videocapure_node" C-m

# tmux select-window -t $SESSION
