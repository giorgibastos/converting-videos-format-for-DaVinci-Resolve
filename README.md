🎬 DaVinci Resolve Video Converter for Linux (Arch-based distros)

A simple script that converts .mkv, .mp4, and other video files into a format fully compatible with DaVinci Resolve on Linux (tested on Garuda, Manjaro, Arch, and derivatives).

The Issue: DaVinci Resolve, especially the free version, often struggles with certain video/audio codecs. This script fixes that by converting your file to the DNxHD codec inside a .mov container, with PCM audio — ready to drag straight into the timeline.

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

Let's understand how the script works!

```bash
#!/bin/bash

input="$1"
output="${input%.*}_dnxhd.mov"

ffmpeg -i "$input" \
  -c:v dnxhd -b:v 36M -pix_fmt yuv422p \
  -c:a pcm_s16le "$output"

echo "File converted to: $output"
```

1. #!/bin/bash
This is the shebang — it tells the system which interpreter to use to run the script.

In this case, we are using the Bash Shell.

2. input="$1"
The input variable receives the first argument passed via the command line.

Example of usage:

```bash
./script.sh video.mp4
```

In this case, input="video.mp4".

3. output="${input%.*}_dnxhd.mov"
Here we use Bash parameter expansion:

${input%.*} removes the file extension (.mp4, .avi, etc.).

Then we add the _dnxhd.mov suffix.

📌 Example:

```bash
input="meuvideo.mp4"
output="meuvideo_dnxhd.mov"
```

4. The command ffmpeg
```bash
ffmpeg -i "$input" \
  -c:v dnxhd -b:v 36M -pix_fmt yuv422p \
  -c:a pcm_s16le "$output"
```

Let’s break it down:

-i "$input"
Sets the input file (original video).

-c:v dnxhd
Sets the video codec to DNxHD (used in professional workflows like Avid Media Composer).

-b:v 36M
Sets the video bitrate to 36 Mbps (megabits per second).
DNxHD works with fixed bitrates. 36 Mbps is compatible with resolutions like 720p @ 25fps.

-pix_fmt yuv422p
Sets the pixel format to YUV 4:2:2 planar.
This format offers better color quality than 4:2:0, making it ideal for editing.

-c:a pcm_s16le
Sets the audio codec to PCM linear, 16-bit, little endian.
This is uncompressed audio, used to preserve maximum quality.

"$output"
Output file name, created earlier with the _dnxhd.mov suffix.


5. echo "File converted to: $output"
   Just a confirmation message, showing the name of the generated file.




