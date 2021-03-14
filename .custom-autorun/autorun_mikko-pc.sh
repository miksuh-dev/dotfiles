nvidia-settings --load-config-only &

$HOME/Programs/FreeFileSync/fileserver_sync.sh &

xrandr --output DP-0 --mode 2560x1440 --rate 144
xrandr --output DP-4 --mode 2560x1440 --rate 144 --primary --right-of DP-0
xrandr --output DP-2 --mode 2560x1440 --rate 144 --right-of DP-4

nitrogen --set-zoom-fill /home/miksuh/Pictures/taustakuvat/5120x1440/armenia_khustup_k13_annihilation_hayk-wallpaper-5120x1440.jpg