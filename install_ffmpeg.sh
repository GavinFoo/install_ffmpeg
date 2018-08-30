#http://trac.ffmpeg.org/wiki/CompilationGuide/Centos

yum install autoconf automake cmake freetype-devel gcc gcc-c++ git libtool make mercurial nasm pkgconfig zlib-devel -y

mkdir ~/ffmpeg_sources

cd ~/ffmpeg_sources
curl -O -L http://www.nasm.us/pub/nasm/releasebuilds/2.13.02/nasm-2.13.02.tar.bz2
tar xjvf nasm-2.13.02.tar.bz2
cd nasm-2.13.02
./autogen.sh
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
make distclean

cd ~/ffmpeg_sources
curl -O -L http://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz
tar xzvf yasm-1.3.0.tar.gz
cd yasm-1.3.0
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
make distclean


cd ~/ffmpeg_sources
git clone --depth 1 git://git.videolan.org/x264
cd x264
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
make
make install
make distclean


cd ~/ffmpeg_sources
git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean


cd ~/ffmpeg_sources
curl -L -O https://nchc.dl.sourceforge.net/project/lame/lame/3.100/lame-3.100.tar.gz
tar xzvf lame-3.100.tar.gz
cd lame-3.100
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm
make
make install
make distclean


cd ~/ffmpeg_sources
git clone --depth 1 git://source.ffmpeg.org/ffmpeg
cd ffmpeg
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --bindir="$HOME/bin" --pkg-config-flags="--static" --enable-gpl --enable-nonfree --enable-libfdk-aac --enable-libfreetype --enable-libmp3lame --enable-libx264
make
make install
make distclean
hash -r

echo "\nDone\n"
