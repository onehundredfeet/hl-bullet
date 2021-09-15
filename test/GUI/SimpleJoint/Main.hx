import h3d.Vector;

class Main extends hxd.App {

	var world : bullet.World;
	var graphics : h3d.scene.Graphics;

	var staticObject : bullet.Body;
	var dynamicObject : bullet.Body;

	override function init() {

		@:privateAccess hxd.Window.getInstance().window.title = "Joint Simple Example";

		world = new bullet.World(s3d);
		world.setGravity(0,0,0);

		graphics = new h3d.scene.Graphics(s3d);

		// new h3d.scene.fwd.DirLight(new h3d.Vector(-20, 0, 10), s3d);
		// new h3d.scene.fwd.DirLight(new h3d.Vector(20, 0, 10), s3d);
		// new h3d.scene.fwd.DirLight(new h3d.Vector(0, -20, 2), s3d);
		// new h3d.scene.fwd.DirLight(new h3d.Vector(0, 20, -2), s3d);

		// new h3d.scene.fwd.Point(new h3d.Vector(-20, 0, 10), s3d);

		var myPointLight = new h3d.scene.fwd.PointLight(s3d);
		//Set the position on the light
		myPointLight.x = 10;
		myPointLight.y = 10;
		myPointLight.z = 50;
		//Set the color on the light
		myPointLight.color.setColor(0xffffff);


		// var myPointLight2 = new h3d.scene.fwd.PointLight(s3d);
		// //Set the position on the light
		// myPointLight2.x = 20;
		// myPointLight2.y = 20;
		// myPointLight2.z = -50;
		// //Set the color on the light
		// myPointLight2.color.setColor(0xffffff);

		var floor = new bullet.Body(bullet.Shape.createBox(100, 100, 0.1), 0, world);
		var floorMesh = floor.initObject();
		floorMesh.material.color.setColor(0x909090);
		floor.setTransform(new bullet.Point(0, 0, -10));

		//create a few dynamic rigidbodies
		staticObject = new bullet.Body(bullet.Shape.createBox(1,1,1), 0, world);
		var staticObjectMesh = staticObject.initObject();
		staticObject.setTransform(new bullet.Point(0, 0, 0));
		staticObjectMesh.material.color.setColor(0x20f020);

		dynamicObject = new bullet.Body(bullet.Shape.createBox(1,1,1), 1, world);
		var dynamicObjectMesh = dynamicObject.initObject();
		dynamicObject.setTransform(new bullet.Point(0, -20, 0));
		dynamicObjectMesh.material.color.setColor(0xf02020);

		// Initialise the constraint between bodies
		var staticRigidBody = @:privateAccess staticObject.inst;
		var dynamicRigidBody = @:privateAccess dynamicObject.inst;
		var point2PointConstraint = new bullet.Native.Point2PointConstraint(
			dynamicRigidBody, 
			staticRigidBody,
			new bullet.Native.Vector3(0, 1.1, 0), new bullet.Native.Vector3(0, 0, 0)); // use (0, 1.1, 0) to maintain a little distance between bodies centers

		point2PointConstraint.m_setting.m_damping = 0.0625;
		point2PointConstraint.m_setting.m_impulseClamp = 0.95;
		
		// Add the raw bullet constraint in the bullet Constraint wrapper and later in the world. 
		var constraint = new bullet.Constraint(point2PointConstraint, world);
		constraint.set_disableCollisionsBetweenLinkedBodies(false);

		new h3d.scene.CameraController(80, s3d);

		// Register keyboard events
		hxd.Window.getInstance().addEventTarget(onEvent);
	}

	public function onEvent(event : hxd.Event) {
		switch(event.kind) {
			case EKeyUp: 
				var currentPos = @:privateAccess dynamicObject.get_position();
				dynamicObject.setTransform(new bullet.Point(currentPos.x, currentPos.y - 20, currentPos.z));
			case _:
		}
	}

	override function update(dt:Float) {
		world.stepSimulation(dt, 1);
		world.sync();
	}

	static function main() {
		new Main();
	}
}
