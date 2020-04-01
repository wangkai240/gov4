#!/bin/bash
cd v2ray
./v2ray&

p_name=v2ray
while true
do
  sleep 3
  ProcNumber=`ps -ef |grep -w $p_name|grep -v grep|wc -l`
  if [ $ProcNumber -le 0 ];then
    exit 0
  else 
    pid=`ps -ef|grep $p_name|awk '{print $2}'|head -n1`
    ptime=`ps -eo pid,etimes|grep $pid|awk '{print $2}' |head -n1`
    etime=777600
    if [[ $ptime -ge $etime ]];then 
      kill -9 $pid
    fi
  fi
done