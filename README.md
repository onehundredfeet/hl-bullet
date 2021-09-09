# Bullet3 Hashlink

## 1. Preparation
* haxelib install webidl
* Clone the repo under ../path/to/Hashlink/libs into ../path/to/Hashlink/libs/bullet
* cd ../path/to/Hashlink/libs
* run `haxelib dev bullet bullet` // This will add bullet lib to haxelib list


## 3. c++ compilation (as *.hdll)
* cd `<hashlink-bullet dir>`
* run `make genhl`
* cd `<hashlink-bullet dir>/build` or choose your favourite cmake location to build from


## Build and Install
Prerequisites:
1. Install haxe: (For linux: https://haxe.org/download/linux/ )
2. Install haxelink: (For linux: http://www.unexpected-vortices.com/haxe/getting-started-hl.html )
3. Install heaps: (For linux: https://heaps.io/documentation/installation.html )
4. Install webidl `haxelib install webidl`

### Build and install

1. Clone this repo in some clean directory, we will call this HL-BULLET-ROOT in this tutorial
   run `haxelib dev bullet bullet` // This will add bullet lib to haxelib list

2. Clone bullet3 c++ sources in other clean directory
    `git clone https://github.com/bulletphysics/bullet3.git`
   The content of /src dir will be used in the next step.
   Note: It is recommended to clone some release tag, or at least make sure that the current cloned commit is stable.

3. Generate bullet.cpp from bullet.idl
   Open new terminal under HL-BULLET-ROOT and  run `make genhl`
3. Generate cmake and build
    Create new dir : HL-BULLET-ROOT/build
    Open new terminal in the directory HL-BULLET-ROOT/build and run:

    3.1 Linux:
    ```
    cmake ..
      -DBULLET_SRC_DIR="<path-to-bullet3>/src" # This is the /src from step 2
      -DHL_INCLUDE_DIR="<path-to-hashlink>/src" # Path to where hashlink headers (hl.h, ...) are located. Usually under ...hashlink-x.xx/src 
      -DHL_LIB_DIR="<path-to-hashlink>" # Path to where hashlink binaries (libhl.so, ...) are located. Usually ...hashlink-x.xx
      -HDLL_DESTINATION="final/install/destination" #The path of all *hdll binaries, usually this is 'usr/lib' or 'usr/local/lib'

    make
    make install
    ```
    cmake specific cmake command example on linux:
    ```
    cmake .. -DBULLET_SRC_DIR="/home/raf/Desktop/bullet3/src" -DHL_INCLUDE_DIR="/home/raf/Desktop/hashlink/hashlink-1.11/src" -DHL_LIB_DIR="/home/raf/Desktop/hashlink/hashlink-1.11" -DHDLL_DESTINATION="/usr/lib"
    ```

    3.2 Windows:
    * run 
    ```
    cmake .. -A x64 -G "Visual Studio 15 2017" 
    -DBULLET_SRC_DIR="<path-to-bullet3>/src" # This is the /src from step 2
      -DHL_INCLUDE_DIR="<path-to-hashlink>/include"
      -DHL_LIB_DIR="<path-to-hashlink>"  # Path to where hashlink binaries (libhl.lib, ...) are located
      -HDLL_DESTINATION="final/install/destination" # Usually <path-to-hashlink>
    ```
    * open and build build/Project.sln
    * copy ./build/Debug/bullet.hdll -> ../path/to/HashLink/hdll/location/ # Visual Studio install step may fail, so make sure to move this manually if so


    3.3 Mac:
    * run: 
    ```
    cmake ..  -GNinja 
    -DBULLET_SRC_DIR="<BulletDir>/src" 
    -DHL_LIB_DIR="/usr/local/lib" 
    -DHL_INCLUDE_DIR="/usr/local/include" 
    -DHDLL_DESTINATION="/usr/local/lib"
    ```
* Note: brew has installed HL to these directories


### Test
Open new terminal in HL-BULLET-ROOT/sample-gui and run:
Note: If directx is not available, then open the new terminal in HL-BULLET-ROOT/sample-no-gui
run
```
haxe compile.hxml # This will generate the sample.hl file
hl sample.hl 
```
