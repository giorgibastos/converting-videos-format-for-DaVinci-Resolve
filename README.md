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

Let's understand how the script works!

```bash
#!/bin/bash

input="$1"
output="${input%.*}_dnxhd.mov"

ffmpeg -i "$input" \
  -c:v dnxhd -b:v 36M -pix_fmt yuv422p \
  -c:a pcm_s16le "$output"

echo "Arquivo convertido para: $output"
```

1. #!/bin/bash
Isso aqui é o shebang — indica qual interpretador será usado para rodar o script.

No caso, estamos usando o Bash Shell.

2. input="$1"
A variável input recebe o primeiro argumento passado na linha de comando.

Exemplo de uso:
```bash
./script.sh video.mp4
```

Nesse caso, input="video.mp4".

3. output="${input%.*}_dnxhd.mov"
Aqui usamos expansão de parâmetros do Bash:

${input%.*} remove a extensão do arquivo (.mp4, .avi, etc.).

Depois adicionamos o sufixo _dnxhd.mov.
📌 Exemplo:
```bash
input="meuvideo.mp4"
output="meuvideo_dnxhd.mov"
```

4. O comando ffmpeg
```bash
ffmpeg -i "$input" \
  -c:v dnxhd -b:v 36M -pix_fmt yuv422p \
  -c:a pcm_s16le "$output"
```

Vamos por partes:

-i "$input"
Define o arquivo de entrada (vídeo original).

-c:v dnxhd
Define o codec de vídeo como DNxHD (usado em workflows profissionais como Avid Media Composer).

-b:v 36M
Define o bitrate do vídeo: 36 Mbps (megabits por segundo).

DNxHD funciona com bitrates fixos. 36 Mbps é compatível com resoluções como 720p @ 25fps.

-pix_fmt yuv422p
Define o formato de pixel como YUV 4:2:2 planar.

Esse formato tem mais qualidade de cor que o 4:2:0, ideal pra edição.

-c:a pcm_s16le
Define o codec de áudio como PCM linear, 16 bits, little endian.

É áudio sem compressão, usado para preservar qualidade máxima.

"$output"
Nome do arquivo de saída que criamos anteriormente com _dnxhd.mov no final.

5. echo "Arquivo convertido para: $output"
Apenas uma mensagem de confirmação, mostrando o nome do arquivo gerado.


