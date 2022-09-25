#!/bin/bash

function no_ctrlc()
{
  echo ""
  echo "-----------------------------------------------"
  echo ""
  exit
}

trap no_ctrlc SIGINT

PID="0"
R1="1"
R2="1"
while (true); do
  R1="1"
  if [ "$PID" != "0" ]; then
    ps -p $PID 2>&1 > /dev/null
    R1="$?"
  fi

  sleep 1
  ping -c 1 192.168.31.1 2>&1 > /dev/null
  R2="$?"

  # echo "$R1 $R2"

  if [ "$R2" == "0" ]; then
    if [ $R1 == "0" -a $PID != "0"  ]; then
      kill -9 $PID 2>&1 > /dev/null
      PID="0"
      R1="1"
    fi
    echo `date` "OK"
  else
    if [ $R1 == "0" ]; then
      echo `date` "ERR - Playing sound..."
    else
      mplayer /home/hightemp/__SpecFolders__/Sounds/alarm_03.mp3 2>&1 > /dev/null &
      PID="$!"
      echo `date` "ERR"
    fi
  fi
done
