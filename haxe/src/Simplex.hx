abstract Dyn<T>(Dynamic) from T to T {}

typedef HLExtResult = {
	var greeting:HString;
	var age:Int;
}

@:access(String)
@:forward
abstract HString(String) from String to String {
	@:from static public inline function fromBytes(b:hl.Bytes):HString
		return switch b {
					case null: null;
					default: String.fromUCS2(b);
			}
	
	@:to public inline function toBytes():hl.Bytes
		return switch this {
					case null: null;
					default: this.bytes;
			}
}

private typedef HLExtResultHandler = hl.Abstract<"hlext_result">;
private typedef HLExtClassHandler = hl.Abstract<"hlext_class">;

@:hlNative("simplex")
private class CLib
{
	public static function requestClass(a: Int, b: Int ) : HLExtClassHandler { return null; }
    public static function getClassSum(instance : HLExtClassHandler ) : Int { return 0; }

	public static function requestResult( name:hl.Bytes, birthYear:Int, currentYear:Int ) : HLExtResultHandler { return null; }
	public static function resultGreeting( result:HLExtResultHandler ) : Null<hl.Bytes> { return null; }
	public static function resultAge( result:HLExtResultHandler ) : Int { return 0; }
	public static function getHaxeObject( name:hl.Bytes, birthYear:Int, currentYear:Int ) : Dyn<{greeting:hl.Bytes, age:Int}> { return null; }
}

class Simplex {
	
	private var result:HLExtResultHandler;
    
	public function new(name : HString, birthYear : Int, currentYear : Int) {
		result = CLib.requestResult(name, birthYear, currentYear);
	}

    public function requestClass(a: Int, b: Int):HLExtClassHandler {
        return CLib.requestClass(a, b);
    }

	public function getGreeting():HString {
		if (result == null) return '';
		
		return CLib.resultGreeting(result);
	}
	
	public function getAge() {
		if (result == null) return 0;
		
		return CLib.resultAge(result);
	}
	
    public function getClassSum(instance : HLExtClassHandler){
        return CLib.getClassSum(instance);
    }

	static public function getHaxeObject( name : HString, birthYear : Int, currentYear : Int ) : HLExtResult {
		var r:{greeting:hl.Bytes, age:Int} = CLib.getHaxeObject(name, birthYear, currentYear);
		var hlextResult:HLExtResult = {greeting : r.greeting, age : r.age};
		return hlextResult;
	}
	
}