#!/bin/bash

input="$1"
output="${input%.*}_dnxhd.mov"

ffmpeg -i "$input" \
  -c:v dnxhd -b:v 36M -pix_fmt yuv422p \
  -c:a pcm_s16le "$output"

echo "Arquivo convertido para: $output"
