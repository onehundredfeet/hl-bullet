
class KinematicRigidBodyExample extends hxd.App {

	var world : bullet.World;

	override function init() {

		world = new bullet.World(s3d);
		world.setGravity(0,0,-9.81);

		var floor = new bullet.Body(bullet.Shape.createBox(100,100,1),0, world);
		var mesh = floor.initObject();
		mesh.material.color.setColor(0x808080);

		new h3d.scene.fwd.DirLight(new h3d.Vector(1, 2, -4), s3d);

		for (k in 0...5) {
            for (i in 0...5) {
                for (j in 0...5) {
                    var body = new bullet.Body(bullet.Shape.createBox(1, 1, 1), 1, world);
                    var mesh = body.initObject();
                    mesh.x = i;
                    mesh.y = k;
                    mesh.z = 20 + j;
                    body.loadPosFromObject();
                    mesh.material.color.set(0, 0.5, 1);
                }
            }
        }

		new h3d.scene.CameraController(80, s3d);
	}

	override function update(dt:Float) {
		world.stepSimulation(dt, 1);
		world.sync();
	}

	static function main() {
		new KinematicRigidBodyExample();
	}
}



// struct KinematicRigidBodyExample : public CommonRigidBodyBase
// {
// 	btRigidBody* m_groundBody;

// 	KinematicRigidBodyExample(struct GUIHelperInterface* helper)
// 		: CommonRigidBodyBase(helper),
// 		  m_groundBody(0)
// 	{
// 	}

// 	virtual void stepSimulation(float deltaTime)
// 	{
// 		if (m_dynamicsWorld)
// 		{
// 			m_dynamicsWorld->stepSimulation(deltaTime);
// 		}
// 	}

// 	virtual ~KinematicRigidBodyExample() {}
// 	virtual void initPhysics();
// 	virtual void renderScene();
// 	void resetCamera()
// 	{
// 		float dist = 4;
// 		float pitch = -30;
// 		float yaw = 50;
// 		float targetPos[3] = {0, 0, 0};
// 		m_guiHelper->resetCamera(dist, yaw, pitch, targetPos[0], targetPos[1], targetPos[2]);
// 	}
// };