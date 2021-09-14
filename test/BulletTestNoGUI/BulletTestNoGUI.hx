

class BulletTestNoGUI {

	public static function testGravity() {
		var world = new bullet.World();
		world.setGravity(0,0,-9.81);

		var body = new bullet.Body(bullet.Shape.createSphere(1), 1, world);
		var mesh = body.initObject();

		var timestamp = 0.0;
		var deltaSeconds = 0.04;

		for (i in 0...100) {
			trace('Elapsed time: $timestamp (seconds)   position : ${@:privateAccess body.get_position()}');
			world.stepSimulation(1, 1);
			world.sync();

			timestamp += deltaSeconds;
		}
	}

	static function main() {
		testGravity();
	}
}



