#!/bin/bash

WALLPAPER_DIR="/home/atp/.config/niri/wallpapers"

TRANSITION1="--transition-type wave --transition-angle 120 --transition-step 30"
TRANSITION2="--transition-type wipe --transition-angle 30 --transition-step 30"
TRANSITION3="--transition-type center --transition-step 30"
TRANSITION4="--transition-type outer --transition-pos 0.3,0.8 --transition-step 30"
TRANSITION5="--transition-type wipe --transition-angle 270 --transition-step 30"

select_random_wallpaper() {
  local wallpapers=($(find "$WALLPAPER_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.webp" \) | sort))
  if [ ${#wallpapers[@]} -eq 0 ]; then
    echo "错误：目录 '$WALLPAPER_DIR' 中没有找到图片文件" >&2
    exit 1
  fi
  echo "${wallpapers[$((RANDOM % ${#wallpapers[@]}))]}"
}

if [ ! -d "$WALLPAPER_DIR" ]; then
  mkdir -p "$WALLPAPER_DIR"
fi

WALLPAPER=$(select_random_wallpaper)

NUM=$(((RANDOM % 5) + 1))
case $NUM in
1) TRANSITION="$TRANSITION1" ;;
2) TRANSITION="$TRANSITION2" ;;
3) TRANSITION="$TRANSITION3" ;;
4) TRANSITION="$TRANSITION4" ;;
5) TRANSITION="$TRANSITION5" ;;
esac

swww img "$WALLPAPER" $TRANSITION
