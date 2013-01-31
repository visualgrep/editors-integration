#!/bin/bash

if [ $(($# % 3)) -ne 0 ]
then
	echo "Parameters count must be divible by 3"
	exit 1
fi

APP_NAME="edit"

args=("$@")
let END=$# i=0
CMD_LINE=()

while ((i < END))
do
    FILE_NAME=${args[$i]}
    LINE_NUM=${args[$i + 1]}
    COL_NUM=${args[$i + 2]}

    CMD_LINE+=(+$LINE_NUM "$FILE_NAME")

    let i+=3
done

"$APP_NAME" "${CMD_LINE[@]}"