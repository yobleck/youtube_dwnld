@echo off
color 02
echo yobleck's easy song downloader

echo enter url:
set /P url= 

echo enter title:
set /P title= 

echo enter artist:
set /P artist= 

youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --socket-timeout 1 --retries infinite -o "%artist% - %title%1.%%(mp3)s" %url%

ffmpeg -i "%artist% - %title%1.mp3" -acodec copy -metadata title="%title%" -metadata artist="%artist%" "%artist% - %title%.mp3"
REM      -codec:a libmp3lame -qscale:a 2

del "%artist% - %title%1.mp3"

pause
