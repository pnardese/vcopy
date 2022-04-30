#!/bin/bash

echo Copia $1 in $2
sleep 2

rsync -av --progress --append $1 $2

USER=`id -un`

ECHO $USER

echo Crea struttura MHL
sleep 2
ascmhl create -v --author_name $USER $2

