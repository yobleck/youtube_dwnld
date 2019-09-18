#!/bin/bash
echo "yobleck's easy song downloader"

echo "enter url:"
read url

echo "enter title:"
read title

echo "enter artist:"
read artist

youtube-dl --extract-audio --audio-quality 0 --audio-format wav --socket-timeout 1 --retries infinite -o "$artist - $title 1.wav" $url

ffmpeg -i "$artist - $title 1.wav" -codec:a libmp3lame -qscale:a 2 -metadata title="$title" -metadata artist="$artist" "$artist - $title.mp3"

unlink "$artist - $title 1.wav"
