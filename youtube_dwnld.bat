@echo off
color 02
echo yobleck's easy song downloader

echo enter url:
set /P url= 

echo enter title:
set /P title= 

echo enter artist:
set /P artist= 
REM       
youtube-dl --extract-audio --audio-quality 0 --audio-format wav --socket-timeout 1 --retries infinite -o "%artist% - %title%1.%%(wav)s" %url%

ffmpeg -i "%artist% - %title%1.wav" -codec:a libmp3lame -qscale:a 2 -metadata title="%title%" -metadata artist="%artist%" "%artist% - %title%.mp3"
REM         -acodec copy             way more time consuming now

del "%artist% - %title%1.wav"

pause
