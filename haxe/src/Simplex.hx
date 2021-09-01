// abstract Dyn<T>(Dynamic) from T to T {}

// typedef HLExtResult = {
// 	var greeting:HString;
// 	var age:Int;
// }

// @:access(String)
// @:forward
// abstract HString(String) from String to String {
// 	@:from static public inline function fromBytes(b:hl.Bytes):HString
// 		return switch b {
// 					case null: null;
// 					default: String.fromUCS2(b);
// 			}
	
// 	@:to public inline function toBytes():hl.Bytes
// 		return switch this {
// 					case null: null;
// 					default: this.bytes;
// 			}
// }

private typedef HLExtClassHandler = hl.Abstract<"hlext_class">;
private typedef BulletHandler = hl.Abstract<"bullet">;
// private typedef BulletVectorHandler = hl.Abstract<"bullet_vector">;

// @:hlNative("simplex")
// private class CLib
// {
// 	// public static function requestClass(a: Int, b: Int ) : HLExtClassHandler { return null; }
//     // public static function getClassSum(instance : HLExtClassHandler ) : Int { return 0; }
//     public static function requestBulletVector(a: Float, b: Float, c: Float) : BulletVectorHandler { return null; }
//     public static function vectorValuex(source: BulletVectorHandler) : Int { return 0; }
// }

@:hlNative("simplex")
class Simplex {
    public static function requestClass(a: Int, b: Int ) : HLExtClassHandler { return null; }
    public static function getClassSum(instance : HLExtClassHandler ) : Int { return 0; }

    public static function requestBullet(a: Float, b: Float, c: Float ) : BulletHandler { return null; }
    public static function getBulletSum(instance : BulletHandler ) : Float { return 0; }
    public static function bulletOperatorPlus(a : BulletHandler, b : BulletHandler ) : BulletHandler { return null; }

    //public static function requestBulletVector(a: Float, b: Float, c: Float) : BulletVectorHandler { return null; }
    // public static function vectorValuex(source: BulletVectorHandler) : Int { return 0; }

	// public function new() {
	// 	//result = CLib.requestResult(name, birthYear, currentYear);
	// }

    // public function requestBulletVector(a: Float, b: Float, c: Float):HLExtBulletVectorHandler {
    //     return null; 
    //     // return CLib.requestBulletVector(a, b, c);
    // }

    // public function requestBulletVectorX(a : HLExtBulletVectorHandler) : Float { 
    //     return 0; //CLib.requestBulletVectorValuex(a);
    // }
    
    // public function requestBulletVectorOperatorPlus(a: HLExtBulletVectorHandler, b: HLExtBulletVectorHandler) : HLExtBulletVectorHandler { 
    //     return null; //CLib.requestBulletVectorOperatorPlus(a, b);
    // }

    // public function requestClass(a: Int, b: Int):HLExtClassHandler {
    //     return CLib.requestClass(a, b);
    // }

    // public function getClassSum(instance : HLExtClassHandler){
    //     return CLib.getClassSum(instance);
    // }
}