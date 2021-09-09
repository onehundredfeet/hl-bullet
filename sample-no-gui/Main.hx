
class Main{
	static function main() {
		trace("Init");
		var vec = new h3d.Vector(1, 2, 3);
		var mat = new h3d.Matrix();
		mat.identity();
		mat.colorHue(Math.random() * Math.PI * 2);

		trace("bt vector3: ", vec);
		trace("bt matrix: ", mat);
	}
}
