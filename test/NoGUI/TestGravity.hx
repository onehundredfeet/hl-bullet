

class TestGravity {

	static var world : bullet.World;

	public static function main() {
		trace ("TestGravity Begin");
		var world = new bullet.World();
		world.setGravity(0,0,-9.81);

		var sphere = new bullet.Body(bullet.Shape.createSphere(1), 1, world);
		var sphereMesh = sphere.initObject();

		var timestamp = 0.0;
		var deltaSeconds = 1;
		var simulationFrames = 1;
		
		for (i in 0...10) {
			// Read sphere position
			var newPos = @:privateAccess sphere.get_position();
			trace('Elapsed time: $timestamp (seconds)   position : $newPos');

			// Increment simulation
			world.stepSimulation(deltaSeconds, simulationFrames);
			world.sync();
			timestamp += deltaSeconds;
		}

		sphere.remove();
		sphere.delete();
		trace ('TestGravity Done');
	}
}



