#!/bin/bash

var1="predictpose"
echo $var1
#var2=".csv"
#var3="s"
numiter=10
# in seconds
tracedurn=100
durnins="${tracedurn}s"
echo running $durnins
echo something

#sleep 10s
# we run 10 iterations, each for a specified time
counter=1
while [ $counter -le $numiter ]
do 
  timeout $durnins ./runner.sh configs/native.yaml
  sleep 10s
  echo $counter
  newfname="predictpose${counter}.csv"
  echo $newfname
  cp recorded_data/pred_pose.csv recorded_data/${newfname}
  ((counter++))
done


