#avconv -f video4linux2 -s 640×360 -r 10 -b 350k -i /dev/video0 -f flv rtmp://10.30.64.57:1935/live1/

#avconv -f video4linux2 -s 640×360 -r 10 -b 350k -i /dev/video0 -f flv rtmp://10.30.64.57:1935/live1/

#!/bin/bash
 INRES=" 1024x768" # input resolution
 OUTRES="640x360"
 OFFSET="100,200"
 FPS="15" # target FPS
 QUAL="fast"  # one of the many FFMPEG preset
 #STREAM_KEY="your_stream_key"
 #URL="rtmp://live.justin.tv/app/$STREAM_KEY"
 URL="rtmp://10.30.64.57:1935/live1/"
  
 avconv -f x11grab -s "$INRES" -r "$FPS" -i :0.0+$OFFSET -ab 192k \
 -f alsa -ac 2 -i pulse -vcodec libx264 -crf 30 -preset "$QUAL" -s "1280x720" \
 -vol 11200 -acodec libmp3lame -ar 44100 -threads 0 \
 -f flv "$URL"


#install libavcodec-extra-53.
#You also may need to install "lame" in order to get sound to work, if you haven't already installed it.

 #avconv -f x11grab -s 1280x1024 -r 15 -i :0.0 -s 1280x1024 -r 15 -sameq video.avi

# avconv -i http://10.0.0.101:2004/bysid/10 -acodec libfaac \
# -acodec libfaac -b:a 96k -vcodec libx264 -filter:v yadif \
# -b:v 900k -preset superfast -threads 4 -bt 2500 -qcomp 0.7 \
# -f flv rtmp://127.0.0.1/live/myStream

# Play streaming
# avplay rtmp://10.30.64.57:1935/live1/
