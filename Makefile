genhl:
	haxe -lib hl-idl --macro "bullet.Generator.generateCpp()"
	
genjs:
	haxe -lib hl-idl --macro "bullet.Generator.generateJs()"
