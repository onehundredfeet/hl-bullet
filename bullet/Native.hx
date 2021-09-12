package bullet;

typedef Native = haxe.macro.MacroType<[webidl.Module.build({ idlFile : "bullet/bullet.idl", chopPrefix : "bt,t", autoGC : true, nativeLib : "bullet" })]>;
