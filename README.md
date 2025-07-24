🎬 DaVinci Resolve Video Converter for Linux (Arch-based distros)

A simple script that converts .mkv, .mp4, and other video files into a format fully compatible with DaVinci Resolve on Linux (tested on Garuda, Manjaro, Arch, and derivatives).

DaVinci Resolve, especially the free version, often struggles with certain video/audio codecs. This script fixes that by converting your file to the DNxHD codec inside a .mov container, with PCM audio — ready to drag straight into the timeline.

✅ Requirements
FFmpeg
Linux (preferably Arch-based)

```bash
sudo pacman -S ffmpeg
```
💡 Usage
```bash
./convert_davinci.sh nome-do-video.mp4
```
The script will create a new .mov file named your-video_dnxhd.mov.

🧠 Why is this useful?
DaVinci Resolve (free version) on Linux doesn’t handle .mkv/.mp4 files with compressed codecs (like H.264 + AAC) very well.
This script converts your video to DNxHD + PCM, which are professional-grade and fully compatible codecs.
