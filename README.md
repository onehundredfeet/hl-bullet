# Bullet3 Hashlink

## Build and Install
##### Note: Most of the following steps are common on windows, linux and mac. The only difference is in the build & install step.

### 1. Prerequisites:
1.1. Install haxe: (For linux: https://haxe.org/download/linux/ )  
1.2. Install haxelink: (For linux: http://www.unexpected-vortices.com/haxe/getting-started-hl.html )  
1.3. Install heaps: (For linux: https://heaps.io/documentation/installation.html )  
1.4. Install webidl:   
```sh
haxelib install webidl
```

### 2. Build & install bullet.hdll  

2.1. Clone this repo in some clean directory, we will call this HL-BULLET-ROOT in this tutorial.   
Open new terminal in this directory.  
```sh
haxelib dev bullet bullet
```

2.2 Clone bullet3 c++ sources in some clean directory
```sh
git clone https://github.com/bulletphysics/bullet3.git
```
   The content of /src dir will be used in the next step.  
    Note: It is recommended to clone some release tag, or at least make sure that the current cloned commit is stable.  
   
2.3 .Open new terminal under HL-BULLET-ROOT and 
```sh
make genhl
```
This will generate bullet.cpp from bullet.idl


2.4 Generate cmake and build.  
**Note: At this step there are differences between platforms**  
    Create new dir : HL-BULLET-ROOT/build  
    Open new terminal in the directory HL-BULLET-ROOT/build and run:  

**For linux:**  
```sh
    cmake ..
      -DBULLET_SRC_DIR="<path-to-bullet3>/src" # This is the /src from step 2
      -DHL_INCLUDE_DIR="<path-to-hashlink>/src" # Path to where hashlink headers (hl.h, ...) are located. Usually under ...hashlink-x.xx/src 
      -DHL_LIB_DIR="<path-to-hashlink>" # Path to where hashlink binaries (libhl.so, ...) are located. Usually ...hashlink-x.xx
      -HDLL_DESTINATION="final/install/destination" #The path of all *hdll binaries, usually this is 'usr/lib' or 'usr/local/lib'
```
```sh
    make
```
```sh
    make install
```
    
specific cmake command example on linux:  
```sh
    cmake .. -DBULLET_SRC_DIR="/home/raf/Desktop/bullet3/src" -DHL_INCLUDE_DIR="/home/raf/Desktop/hashlink/hashlink-1.11/src" -DHL_LIB_DIR="/home/raf/Desktop/hashlink/hashlink-1.11" -DHDLL_DESTINATION="/usr/lib"
   ```

**For windows:**  

```sh
    cmake .. -A x64 -G "Visual Studio 15 2017" 
    -DBULLET_SRC_DIR="<path-to-bullet3>/src" # This is the /src from step 2
      -DHL_INCLUDE_DIR="<path-to-hashlink>/include"
      -DHL_LIB_DIR="<path-to-hashlink>"  # Path to where hashlink binaries (libhl.lib, ...) are located
      -HDLL_DESTINATION="final/install/destination" # Usually <path-to-hashlink>
```

* Open and build build/Project.sln  
* Copy ./build/Debug/bullet.hdll to ../path/to/HashLink/hdll/location/ # Just in case Visual Studio install step fails.  

**For UNIX (Mac / Linux):**  
* Note: Specify the hashlink directories on your system.  On Mac, brew defaults /usr/local (lib/include).
```sh
    cmake ..  -GNinja 
    -DBULLET_SRC_DIR="<BulletDir>/src" 
    -DHL_LIB_DIR="/usr/local/lib" 
    -DHL_INCLUDE_DIR="/usr/local/include" 
    -DHDLL_DESTINATION="/usr/local/lib"
```
```sh
    make
```
```sh
    make install
```

### 3. Test  
Open new terminal in HL-BULLET-ROOT/sample-gui and run:  

haxe compile.hxml

Note: If directx is not available, then open the new terminal in HL-BULLET-ROOT/sample-no-gui  
```
haxe compile.hxml # This will generate the sample.hl file
hl sample.hl 
```
