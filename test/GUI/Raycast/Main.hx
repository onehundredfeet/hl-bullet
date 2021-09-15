import h3d.Vector;

class Main extends hxd.App {

	var world : bullet.World;

	var plane : bullet.Body;

	var rayFrom = new bullet.Native.Vector3(30, 0, 0);
	var rayTo = new bullet.Native.Vector3(-30, 0, 0);

	var graphics : h3d.scene.Graphics;

	override function init() {

		@:privateAccess hxd.Window.getInstance().window.title = "Raytest Example";

		world = new bullet.World(s3d);
		world.setGravity(0,0,0);

		graphics = new h3d.scene.Graphics(s3d);

		new h3d.scene.fwd.DirLight(new h3d.Vector(-10, 0, 2), s3d);
		new h3d.scene.fwd.DirLight(new h3d.Vector(10, 0, -2), s3d);
		new h3d.scene.fwd.DirLight(new h3d.Vector(0, -10, 2), s3d);
		new h3d.scene.fwd.DirLight(new h3d.Vector(0, 10, -2), s3d);

		var floor = new bullet.Body(bullet.Shape.createBox(100, 100, 0.1), 0, world);
		var floorMesh = floor.initObject();
		floorMesh.material.color.setColor(0x909090);
		floor.setTransform(new bullet.Point(0, 0, -10));
		
		plane = new bullet.Body(bullet.Shape.createBox(10,5,10), 0.1, world);
		var planeMesh = plane.initObject();
		planeMesh.material.color.setColor(0x50f050);

		new h3d.scene.CameraController(80, s3d);
	}

	override function update(dt:Float) {

		// Rotate the box
		@:privateAccess plane.set_angularVelocity(new bullet.Native.Vector3(0, 0, 1));

		// Check in the firstraycast intersection each frame
		var raycastResult = new bullet.Native.ClosestRayResultCallback(rayFrom, rayTo);
		@:privateAccess world.inst.rayTest(rayFrom, rayTo, raycastResult);

		if (raycastResult.hasHit()) {
			var intersection = @:privateAccess bullet.Point.fromVec3(raycastResult.m_hitPointWorld);
			
			graphics.clear();
			graphics.lineStyle(1, 0xFF0000);
			graphics.drawLine(@:privateAccess bullet.Point.fromVec3(rayFrom), @:privateAccess bullet.Point.fromVec3(rayTo));

			graphics.lineStyle(2, 0x0000FF);
			graphics.drawLine(intersection, new bullet.Point(intersection.x + 1, intersection.y, intersection.z));
			graphics.drawLine(intersection, new bullet.Point(intersection.x - 1, intersection.y, intersection.z));
			graphics.drawLine(intersection, new bullet.Point(intersection.x, intersection.y, intersection.z + 1));
			graphics.drawLine(intersection, new bullet.Point(intersection.x, intersection.y, intersection.z - 1));
			graphics.drawLine(intersection, new bullet.Point(intersection.x, intersection.y + 1, intersection.z));
			graphics.drawLine(intersection, new bullet.Point(intersection.x, intersection.y - 1, intersection.z));

			graphics.material.setDefaultProps("ui");
		}

		world.stepSimulation(dt, 1);
		world.sync();
	}

	static function main() {
		new Main();
	}
}
