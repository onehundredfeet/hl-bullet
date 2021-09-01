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

        var sim1 = new Simplex("ABCdef", 2000, 2010);
        var sim2 = new Simplex("ABCdef", 2000, 3010);
        trace(sim1.getAge()); 
        trace(sim2.getAge()); 


        var sim_haxe = Simplex.getHaxeObject("AsHaxe", 10, 12);
        trace(sim_haxe.age);
        trace(sim_haxe.greeting);

        var haxe_class = sim1.requestClass(100, 200);
        trace(sim1.getClassSum(haxe_class));

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