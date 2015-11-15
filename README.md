# 在CentOS上安装最新的FFMPEG
## 包含 X264 | AAC | MP3 模块
已经在 CentOS 7 中测试

### 安装

```
wget https://raw.github.com/GavinFoo/install_ffmpeg/master/install_ffmpeg.sh
chmod +x install_ffmpeg.sh
./install_ffmpeg.sh
```

### 调用
将input转换为目标码率为4M的1080P的H264视频。也就是刚好满足优酷超清及1080P（视频需超过10分钟）标准的格式。

ffmpeg -i input -b 4000k -minrate 3500k -maxrate 10000k -bufsize 4000k -s 1920x1080 -r 25 -c:v libx264  -strict  -2 output.mp4
