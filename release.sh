#! /bin/bash
VBR="100k"
FPS="30"
QUAL="ultrafast"
YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"

SOURCE="video.mp4"
KEY="$KEY"

ffmpeg \
    -stream_loop -1 -i "$SOURCE" -deinterlace \
    -vcodec libx264 -pix_fmt yuv420p -preset $QUAL -r $FPS -g $(($FPS * 2)) -b:v $VBR \
    -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 5120k \
    -f flv "$YOUTUBE_URL/$KEY"
