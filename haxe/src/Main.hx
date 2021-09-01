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

        var haxe_class = sim1.requestClass(1, 2);
        trace(sim1.getClassSum(haxe_class));

        // var a = 10;
        // var m = Simplex.multiply(20, 5);

        // trace(a);
        // trace(m);
    }
}