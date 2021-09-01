// class Main extends hxd.App {
//     override function init() {
//         var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
//         tf.text = "Hello Hashlink !";
//     }
//     static function main() {
//         new Main();
//     }
// }
import Simplex;

class Main {
    static function main() {

        // var sim1 = Simplex.requestClass(1, 2);
        // var f = Simplex.getClassSum(sim1);
        // trace(f);

        // var sim2 = Simplex.requestBullet(4, 5, 6);
        // var e = Simplex.getBulletSum(sim2);
        // trace(e);

        var bullet1 = Simplex.requestBullet(1, 2, 3);
        trace(Simplex.getBulletSum(bullet1));
        var bullet2 = Simplex.requestBullet(4, 5, 6);
        trace(Simplex.getBulletSum(bullet2));
        bullet1 = Simplex.bulletOperatorPlus(bullet1, bullet2);
        trace(Simplex.getBulletSum(bullet1));



        // trace(f);
        // var haxe_class = sim1.requestClass(100, 200);
        // trace(sim1.getClassSum(haxe_class));

        // var bullet1 = sim1.requestBulletVector(1, 2, 3);
        // var bullet2 = sim1.requestBulletVector(4, 5, 6);
        // trace(sim1.requestBulletVectorX(bullet1));
        // bullet1 = sim1.requestBulletVectorOperatorPlus(bullet1, bullet2);
        // trace(sim1.requestBulletVectorX(bullet1));

        //vector3 = CLib.g
        // var a = 10;
        // var m = Simplex.multiply(20, 5);

        // trace(a);
        // trace(m);
    }
}