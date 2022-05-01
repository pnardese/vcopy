#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "Usare -v per creare mhl o -c per copiare"
    exit 1
fi

while getopts ":cv" opt;
do
    case $opt in
        c)
            echo Copia $2 in $3
            sleep 2
            rsync -av --progress --append $2 $3
            USER=`id -un`
            echo Crea struttura MHL
            sleep 2
            ascmhl create -v --author_name $USER $3
            exit 1
            ;;
        v)
            USER=`id -un`
            echo Crea struttura MHL
            sleep 2
            ascmhl create -v --author_name $USER $2
            exit 1
            ;;
        \?)
            echo "Invalid option: -$OPTARG" >&2
            echo "Usare -v per creare mhl o -c per copiare"
            exit 1
            ;;
    esac
done

echo Copia $1 in $2
sleep 2
rsync -av --progress --append $1 $2
USER=`id -un`
echo Crea struttura MHL
sleep 2
ascmhl create -v --author_name $USER $2





