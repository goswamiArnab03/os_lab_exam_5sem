#!bin/bash

#Write a shell script to display the process which are sleeping(The status of process is
#S)

echo "Sleeping process"

ps -eo pid,ppid,comm,state | awk '$4 == "S" {print $0}'
