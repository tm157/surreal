#!/bin/bash
for c in $(seq 601 800)
do
    #echo $c 
    sh run.sh "--idx $c --ishape 0 --stride 50"
done

