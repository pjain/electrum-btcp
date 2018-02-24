# Tool to generate a .iconset from a png
# (used 400x400 input.png)

mkdir output.iconset
sips -z 16 16     input.png --out output.iconset/icon_16x16.png
sips -z 32 32     input.png --out output.iconset/icon_16x16@2x.png
sips -z 32 32     input.png --out output.iconset/icon_32x32.png
sips -z 64 64     input.png --out output.iconset/icon_32x32@2x.png
sips -z 128 128   input.png --out output.iconset/icon_128x128.png
sips -z 256 256   input.png --out output.iconset/icon_128x128@2x.png
sips -z 256 256   input.png --out output.iconset/icon_256x256.png
#sips -z 512 512   input.png --out output.iconset/icon_256x256@2x.png
#sips -z 512 512   input.png --out output.iconset/icon_512x512.png
#cp input.png output.iconset/icon_512x512@2x.png
iconutil -c icns output.iconset
rm -R output.iconset
