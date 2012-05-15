#!/bin/bash
USAGE="Usage: $0 runtime source dstport filename count"
if [ "$#" == "0" ]; then
    echo "$USAGE"
    exit 1
fi
runtime=$1
source=$2
dstport=$3
filename=$4
count=$5
for ((i = 0; i < ${count}; i++))
do
	cvlc -q --run-time=${runtime} ${source}:width=640:height=480 --sout "#transcode{vcodec=mp4v,vb=4096,scale=1,fps=25}:duplicate{dst=std{access=http,mux=ts,dst=:${dstport}},dst=std{access=file,mux=avi,dst=\"${filename}-${i}.avi\"}}" vlc://quit
    # send ${filename}-${i}.avi to NAS
done
