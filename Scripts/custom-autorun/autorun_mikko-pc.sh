nvidia-settings --load-config-only &

$HOME/Programs/FreeFileSync/fileserver_sync.sh &

#xrandr --output DP-0 --mode 2560x1440 --panning 2560x1440+0+0 --rate 144
#xrandr --output DP-4 --mode 2560x1440 --panning 2560x1440+2560+0 --rate 144 --primary
#xrandr --output DP-2 --mode 2560x1440 --panning 2560x1440+5120+0 --rate 144

# xrandr --output DP-4 --mode 2560x1440 --rate 144 --rotate left
# xrandr --output DP-0 --mode 2560x1440 --right-of DP-4 --rate 144 --primary
# xrandr --output HDMI-0 --mode 2560x1440 --right-of DP-0 --rate 144

xrandr --output DP-4 --mode 2560x1440 --rate 144 --rotate left
xrandr --output DP-0 --mode 2560x1440  --pos 1440x560 --rate 144 --primary
xrandr --output HDMI-0 --mode 2560x1440 --pos 4000x560 --rate 144

# nitrogen --set-zoom-fill /home/miksuh/Pictures/taustakuvat/5120x1440/armenia_khustup_k13_annihilation_hayk-wallpaper-5120x1440.jpg
/home/miksuh/Scripts/styli.sh -w 2560 -h 2560 -b bg-fill -s nature
