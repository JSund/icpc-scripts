#!/bin/sh
# Starts two video streams from the webcam. One high resolution stream
# on port 8080 and a low resolution stream on port 8081.
cvlc -q v4l2:///dev/video0:width=1280:height=720:aspect-ratio="16:9" --sout '#duplicate{dst="transcode{vcodec=mp4v,vb=1024,scale=0.25,fps=10}:duplicate{dst=std{access=http,mux=ts,dst=:8080}}",dst="transcode{vcodec=mp4v,vb=8096,scale=1,fps=25}:duplicate{dst=std{access=http,mux=ts,dst=:8081}}"}'
