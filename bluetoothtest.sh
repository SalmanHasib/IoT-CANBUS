#!/usr/bin/env bash

#WIFISSIDin=$(iwgetid -r)
WIFISSIDin="STWCWF"
readonly WIFISSIDin
echo $WIFISSDin
connected=1
#echo "$(iwgetid -r)"
#echo "Connected"
#if [[ "$WIFISSIDin" == "$WIFISSIDin" ]];then
#  echo "YESSSES"
#else
#  echo "noooo"
#fi

echo "Beginning Run"
while [ $connected==1 ]
do
  echo "Connected"
  TESTCON=$(iwgetid -r)
  if [[ "$TESTCON" == "$WIFISSIDin" ]];then
    connected=1
  elif [[ -z "$TESTCON" ]];then
    connected=0
    break
  fi
done
while [ $connected==0 ]
do
  echo "Running"
  TESTCON=$(iwgetid -r)
  if [[ -z "$TESTCON" ]];then
    connected=0
  elif [[ "$TESTCON" == "$WIFISSIDin" ]];then
    connected=1
    break
  fi
done
echo "Ending Run"
exit 0