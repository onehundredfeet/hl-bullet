

class Main extends hxd.App {

	var world : bullet.World;
	var boxLeft : bullet.Body;
	var boxRight : bullet.Body;
	

	override function init() {

		@:privateAccess hxd.Window.getInstance().window.title = "Velocity Impulse Example";

		world = new bullet.World(s3d);
		world.setGravity(0,0,0);

		var floor = new bullet.Body(bullet.Shape.createBox(20, 20, 0.1),0, world);
		var mesh = floor.initObject();
		mesh.material.color.setColor(0x808080);

		new h3d.scene.fwd.DirLight(new h3d.Vector(1, 2, -4), s3d);

		boxLeft = new bullet.Body(bullet.Shape.createBox(1,1,1), 1, world);
		boxLeft.setTransform(new bullet.Point(-10, 0, 10));
		var boxLeftMesh = boxLeft.initObject();
		boxLeftMesh.material.color.set(0, 0, 1);
		@:privateAccess boxLeft.set_velocity(new bullet.Native.Vector3(5, 0, 0));

		boxRight = new bullet.Body(bullet.Shape.createBox(1,1,1), 1, world);
		boxRight.setTransform(new bullet.Point(10, 0, 10));
		var boxRightMesh = boxRight.initObject();
		boxRightMesh.material.color.set(0, 1, 0);

		new h3d.scene.CameraController(80, s3d);
	}

	override function update(dt:Float) {
		var boxLeftPos = @:privateAccess boxLeft.get_position();
		if (boxLeftPos.x > 0) {
			@:privateAccess boxLeft.set_velocity(new bullet.Native.Vector3(-5, 0, 0));
		 }else if (boxLeftPos.x < -10) {
			@:privateAccess boxLeft.set_velocity(new bullet.Native.Vector3(5, 0, 0));
		}

		@:privateAccess boxRight.set_angularVelocity(new bullet.Native.Vector3(1, 1, 1));

		world.stepSimulation(dt, 1);
		world.sync();
	}

	static function main() {
		new Main();
	}
}
