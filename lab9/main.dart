import 'Kofecar.dart';

Future<void> main() async {
  Machine machine = Machine(0, 0, 0, 0);
  machine.setResource(199);

  print(machine.makingCoffee(200, 50, 100, 50, "Капучино"));
}
