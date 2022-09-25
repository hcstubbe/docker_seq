#!/bin/bash


FILES="corkum/COR1
corkum/COR2
pcc/PCC1
pcc/PCC2"
echo "Spawning pytrim processes"
for i in $FILES ;
do
    (python /app/scripts/pytrim2.py i & )
; done


print("Waiting for pytrim to finish...." )
sleep 15h

print("All done!")