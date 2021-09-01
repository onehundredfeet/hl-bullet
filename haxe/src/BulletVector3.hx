/**
* https://github.com/HaxeFoundation/hashlink/wiki/HashLink-native-extension-tutorial
* https://github.com/HaxeFoundation/hashlink/wiki/C-API-Documentation
* ...
* developers: Traista Rafael <traista.rafael@yahoo.com>
*/


private typedef HLExtBulletVector3 = hl.Abstract<"bullet_vector3">;

@:hlNative("bullet")
private class HLExtBulletVector3Bridge
{
    // Constructor
    public static function newBulletVector3(x : Float, y : Float, z : Float) : HLExtBulletVector3 {return null; }
    
    // Getters
    public static function bulletVector3GetX(source: HLExtBulletVector3) : Float {return 0; }
    public static function bulletVector3GetY(source: HLExtBulletVector3) : Float {return 0; }
    public static function bulletVector3GetZ(source: HLExtBulletVector3) : Float {return 0; }

    // Operators
    public static function bulletVector3OperatorPlus(source : HLExtBulletVector3, other : HLExtBulletVector3) : HLExtBulletVector3  {return null; }
    public static function bulletVector3OperatorMinus(source : HLExtBulletVector3, other : HLExtBulletVector3) : HLExtBulletVector3  {return null; }
    public static function bulletVector3OperatorMultiply(source : HLExtBulletVector3, other : HLExtBulletVector3) : HLExtBulletVector3  {return null; }
    public static function bulletVector3OperatorDivide(source : HLExtBulletVector3, other : Float) : HLExtBulletVector3  {return null; }
   
    // Member functions
    public static function bulletVector3Dot(source : HLExtBulletVector3, other : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3Length2(source : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3Length(source : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3Norm(source : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3SafeNorm(source : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3Distance2(source : HLExtBulletVector3, other : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3Distance(source : HLExtBulletVector3, other : HLExtBulletVector3) : Float  {return 0; }
    public static function bulletVector3SafeNormalize(source : HLExtBulletVector3) : HLExtBulletVector3  {return null; }
    public static function bulletVector3Normalize(source : HLExtBulletVector3) : HLExtBulletVector3  {return null; }
    public static function bulletVector3Normalized(source : HLExtBulletVector3) : HLExtBulletVector3  {return null; }
    public static function bulletVector3Rotate(source : HLExtBulletVector3, axis : HLExtBulletVector3, angle : Float) : HLExtBulletVector3  {return null; }
}

@:hlNative("bullet")
abstract BulletVector3(HLExtBulletVector3) {

    public function new(x : Float, y : Float, z : Float) {
        this = HLExtBulletVector3Bridge.newBulletVector3(x, y, z);
    }

    public function getVal() : HLExtBulletVector3{
        return this;
    }

    public function getX() : Float {
        return HLExtBulletVector3Bridge.bulletVector3GetX(this);
    }

    public function getY() : Float {
        return HLExtBulletVector3Bridge.bulletVector3GetY(this);
    }

    public function getZ() : Float {
        return HLExtBulletVector3Bridge.bulletVector3GetZ(this);
    }

    // TODO integrate operators
    // @:op(A += B)
    // @:op(A -= B)
    // @:op(A *= B)
    // @:op(A /= B)
  

    public function dot(other : BulletVector3) : Float  {
        return HLExtBulletVector3Bridge.bulletVector3Dot(this, other.getVal());
    }

    public function length2() : Float  {
        return HLExtBulletVector3Bridge.bulletVector3Length2(this);
    }

    public function length() : Float  {
        return HLExtBulletVector3Bridge.bulletVector3Length(this);
    }

    public function norm() : Float  {
        return HLExtBulletVector3Bridge.bulletVector3Norm(this);
    }

    public function safeNorm() : Float  {
        return HLExtBulletVector3Bridge.bulletVector3SafeNorm(this);
    }

    public function distance2(other : BulletVector3) : Float  {
        return HLExtBulletVector3Bridge.bulletVector3Distance2(this, other.getVal()); 
    }

    public function distance(other : BulletVector3) : Float  {
        return HLExtBulletVector3Bridge.bulletVector3Distance(this, other.getVal());
    }

    public function safeNormalize() : HLExtBulletVector3  {
        return HLExtBulletVector3Bridge.bulletVector3Normalize(this);
    }

    public function normalize() : HLExtBulletVector3  {
        return HLExtBulletVector3Bridge.bulletVector3Normalize(this);
    }

    public function normalized() : HLExtBulletVector3  {
        return HLExtBulletVector3Bridge.bulletVector3Normalized(this);
    }

    public function rotate(axis : BulletVector3, angle : Float) : HLExtBulletVector3  {
        return HLExtBulletVector3Bridge.bulletVector3Rotate(this, axis.getVal(), angle);
    }
}