
class TestLinearVelocity {

	static var world : bullet.World;

	public static function main() {
		trace ("TestLinearVelocity Begin");

		world = new bullet.World();
		world.setGravity(0, 0, 0);

		var sphere = new bullet.Body(bullet.Shape.createSphere(1), 1, world);
		var sphereMesh = sphere.initObject();

		@:privateAccess sphere.set_velocity(new bullet.Native.Vector3(10, 0, 0));

		var timestamp = 0.0;
		var deltaSeconds = 1;
		var simulationFrames = 1;
		
		for (i in 0...20) {
			trace('Frame: $i  elapsed time: $timestamp (seconds)   position : ${@:privateAccess sphere.get_position()}');
			world.stepSimulation(deltaSeconds, simulationFrames);
			world.sync();
			timestamp += deltaSeconds;
		}

		sphere.remove();
		sphere.delete();

		trace ("TestLinearVelocity Done");
	}
}



