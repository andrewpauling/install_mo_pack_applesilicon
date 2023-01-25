### Install mo_pack for Apple Silicon

The package mo_pack, needed so that the iris package can unpack the Met Office binary format files, does not currently have a build in conda for arm64. But, we can compile and install our own.

To install, we need to first build and install the package `libmo_unpack`, more information [here](https://github.com/SciTools/libmo_unpack).

- You will need to install the XCode Command Line Tools:
```
xcode-select install
```
- You will need CMake. I got this using [Homebrew](https://brew.sh/). Follow the instructions to install homebrew then run:
```
brew install cmake
brew install check
```
- Download and put the script `build_libmo_unpack.sh` where you want to download the code
- Run the script by doing `./build_libmo_unpack.sh`
- At the end of this script you will be asked for your sudo password, it will then install the library and tell you where it put it. For me this was in `/usr/local/lib` and `usr/local/include`
- Next download the `mo_pack` source code:
```
git clone https://github.com/SciTools/mo_pack
```
- cd into `mo_pack`, activate the conda environment you want to install it in  and then run:
```
python setup.py build_ext -I/usr/local/include -L/usr/local/lib -R/usr/local/lib
pip install -e .
```

You should be good to go!