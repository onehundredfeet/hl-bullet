/**
* https://github.com/HaxeFoundation/hashlink/wiki/HashLink-native-extension-tutorial
* https://github.com/HaxeFoundation/hashlink/wiki/C-API-Documentation
* ...
* developers: Traista Rafael <traista.rafael@yahoo.com>
*/


import BulletVector3;

class Main {
    static function main() {
        var forward = new BulletVector3(10, 15, 3);
        var backward = new BulletVector3(-10, 15, 3);

        trace("Forward (" + forward.getX() + ", " + forward.getY() + ", " + forward.getZ() + ")");
        trace("length: " + forward.length());
        trace("dot: " + forward.dot(backward));
    }
}