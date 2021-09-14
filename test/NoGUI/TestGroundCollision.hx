

class TestGroundCollision {

	static var world : bullet.World;

	public static function main() {
		trace ("TestGroundCollision Begin");

		world = new bullet.World();
		world.setGravity(0,0,-9.81);

		var floor = new bullet.Body(bullet.Shape.createBox(10, 10, 1), 0, world); // mass = 0, used to disable gravity
		var floorMesh = floor.initObject();

		var sphere = new bullet.Body(bullet.Shape.createSphere(1), 1, world);
		sphere.setTransform(new bullet.Point(0, 0, 5), new h3d.Quat());
		var sphereMesh = sphere.initObject();

		var timestamp = 0.0;
		var deltaSeconds = 1;
		var simulationFrames = 4;
		
		for (i in 0...50) {
			trace('Frame: $i  elapsed time: $timestamp (seconds)   position : ${@:privateAccess sphere.get_position()}');
			world.stepSimulation(deltaSeconds, simulationFrames);
			world.sync();
			timestamp += deltaSeconds;
		}

		// Do some cleanup
		floor.remove();
		floor.delete();
		sphere.remove();
		sphere.delete();

		trace ("TestGroundCollision Done");
	}
}



