#!/bin/bash


INPUTPATHS="x1
x2
x3
x4"
echo "Spawning pytrim processes"
for i in $INPUTPATHS
do
    (python /app/pytrim2.py i & )
done


print("Waiting for pytrim to finish...." )
sleep 15h

print("All done!")