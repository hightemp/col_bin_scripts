#!/bin/bash

# source ~/.bashrc
tunnel_front_dev="ssh -N -L 2022:localhost:65322 VM-FRONT-DEV"
tunnel_db1_dev="ssh -N -L 23306:vm-db1-dev.local:3306 VM-FRONT-DEV"
tunnel_front="ssh -N -L 2023:localhost:65322 VM-FRONT"
tunnel_db1="ssh -N -L 23307:vm-db1.local:3306 VM-FRONT"
tunnel_stage_db="ssh -N -L 23308:localhost:3306 VM-STAGE"

als=( "tunnel_db1" "tunnel_db1_dev" "tunnel_stage_db" "tunnel_front" "tunnel_front_dev" )

echo `date` "KILLING OLD PROCESSES"
for al in "${als[@]}"; do
                if [[ -f "$al.pid" ]]; then
                        pid=`cat "$al.pid"`
                        ps -p "$pid" > /dev/null 2>&1
                        if [ "$?" -eq 0 ]; then
				kill -9 $pid
                        fi
                fi
done

echo `date` "START"
while true ; do
	for al in "${als[@]}"; do
		if [[ -f "$al.pid" ]]; then
			pid=`cat "$al.pid"`
			ps -p "$pid" > /dev/null 2>&1
			if [ "$?" -eq 0 ]; then
				continue
			fi
		fi
                echo `date` "RUN $al"
                nohup ${!al} & echo $! > "$al.pid"
	done
done
