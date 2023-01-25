### Install mo_pack for Apple Silicon

The package mo_pack, needed so that the iris package can unpack the Met Office binary format files, does not currently have a build in conda for arm64. But, we can compile and install our own.

To install, we need to first build and install the package `libmo_unpack`, more information [here](https://github.com/SciTools/libmo_unpack).

- You will need to install the XCode Command Line Tools:
```
xcode-select install
```
- Download and put the script `build_libmo_unpack.sh` where you want to download the code
- Run the script by doing `./build_libmo_unpack.sh`