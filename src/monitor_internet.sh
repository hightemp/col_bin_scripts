#!/bin/bash

function no_ctrlc()
{
  echo ""
  echo "-----------------------------------------------"
  echo ""
  exit
}

trap no_ctrlc SIGINT

# HOST01="aliexpress.com"
HOST01="expobank.ru"
HOST02="www.google.com"
# HOST01="www.google.com"
# HOST02="ya.ru"

PID="0"
R1="1"
R2="1"
while (true); do
  R1="1"
  if [ "$PID" != "0" ]; then
    ps -p $PID 2>&1 > /dev/null
    R1="$?"
  fi

  ping -c 1 $HOST01 2>&1 > /dev/null
  R2="$?"

  sleep 1s

  if [ "$R2" != "0" ]; then
    echo `date` "[E] $HOST01";
    sleep 1s
    ping -c 1 $HOST02 2>&1 > /dev/null
    R2="$?"
  fi 

  # echo "$R1 $R2"

  if [ "$R2" == "0" ]; then
    if [ $R1 == "0" -a $PID != "0"  ]; then
      kill -9 $PID 2>&1 > /dev/null
      PID="0"
      R1="1"
    fi
    echo `date` "OK"
  else
    echo `date` "[E] $HOST02";
    if [ $R1 == "0" ]; then
      echo `date` "ERR - Playing sound..."
    else
      mplayer /home/hightemp/__SpecFolders__/Sounds/alarm_02.mp3 2>&1 > /dev/null &
      PID="$!"
      echo `date` "ERR"
    fi
  fi
done
