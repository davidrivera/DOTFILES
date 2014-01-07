#! /bin/bash
WALLPAPERS="/home/david/Pictures/wallpapers/"
ALIST=( `ls -w1 $WALLPAPERS` )
RANGE=${#ALIST[@]}
let "number = $RANDOM"
let LASTNUM="`cat $WALLPAPERS/.last` + $number"
let "number = $LASTNUM % $RANGE"
echo $number > $WALLPAPERS/.last
/usr/bin/awsetbg $WALLPAPERS/${ALIST[$number]}

