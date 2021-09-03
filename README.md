# Bullet3 Hashlink

## Preparation
* haxelib install webidl
* Clone the repo under ../path/to/Hashlink/libs/bullet
* run `haxelib dev bullet` // This will add bullet lib to haxelib list

## Clone c++ version of bullet3
Note: It is recommended to clone some release tag, or at least make sure that the current cloned commit is stable.
* Create new folder somewhere on disk and clone https://github.com/bulletphysics/bullet3 . 

## c++ ompilation (as *.hdll)
* run `make gen_hl`
* run `cmake .. -A x64 -G "Visual Studio 15 2017" -DBULLET_SRC_DIR="path/to/bullet3/src" -DHL_DIR="path/to//HashLink/hdll/location/"`
* open and build build/Project.sln
* copy ./build/Debug/bullet.hdll -> ../path/to/HashLink/hdll/location/  Add this together with the other hdll files

## Run example
* navigate to /sample
* run `haxe compile.hxml`
* run `hl sample.hl`
