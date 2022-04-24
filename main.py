import os

source = "video.mp4"
youtube_url = "rtmp://a.rtmp.youtube.com/live2"
fps = 60
vbr = "100k"
qual = "medium"
key = "azup-dwm3-rs0c-m74v-6vz2"

os.system("chmod +x ffmpeg")
os.system(f'./ffmpeg -stream_loop -1 -i "{source}" -vcodec libx264 -pix_fmt yuv420p -preset {qual} -r {fps} -g $(({fps} * 2)) -b:v {vbr} -acodec libmp3lame -ar 44100 -threads 6 -qscale 3 -b:a 712000 -bufsize 5120k -f flv "{youtube_url}/{key}"')