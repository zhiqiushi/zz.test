#!/bin/bash
case $1 in
   Active) 
  curl  192.168.246.136 2>/dev/null | grep Active|awk '{print $3}'
;;
   accepts) 
   curl  192.168.246.136 2>/dev/null |awk 'NR==3{print $1}'
;;
   handled) 
   curl  192.168.246.136 2>/dev/null |awk 'NR==3{print $2}'
;;
   requests) 
   curl  192.168.246.136 2>/dev/null |awk 'NR==3{print $3}'
;;
   Reading) 
   curl  192.168.246.136 2>/dev/null |awk 'NR==4{print $2}'
;;
   Writing) 
   curl  192.168.246.136 2>/dev/null |awk 'NR==4{print $4}'
;;
   Waiting) 
   curl  192.168.246.136 2>/dev/null |awk 'NR==4{print $6}'
;;
cpu)
    top -b -n 1 | grep Cpu |awk -F ',' '{print $4}'|awk '{print $1}'
;;
uptime5)
     uptime |awk -F ':' '{print $5}'|awk -F ',' '{print$1}'
;;
uptime10)
     uptime |awk -F ':' '{print $5}'|awk -F ',' '{print$2}'
;;
uptime15)
     uptime |awk -F ':' '{print $5}'|awk -F ',' '{print$3}'
;;
ps)
    ps -ef | wc -l
;;
mem1)
     free -m|awk 'NR==2{print $2}'
;;
mem2)
     free -m|awk 'NR==2{print $4}'
;;
buffer)
     free -m|awk 'NR==2{print $6}'
;; 
   *)
    echo "输入错误"
;;
esac
