#!/bin/bash 

# usage:
# ./build.sh board  [flash]
# board is s207 or s208 
# flash after build 

if [ $1 == "s208" ]; then 
    make -fnucleo_8s208.mk 
    if [[ ! -z $2 && ($2 == "flash") ]]; then 
        make -fnucleo_8s208.mk flash 
    fi 
else 
    if [ $1 == "s207" ]; then 
        make -fnucleo_8s207.mk
        if [[ ! -z $2 && ($2 == "flash") ]]; then 
            make -fnucleo_8s207.mk flash 
        fi 
    fi 
fi


