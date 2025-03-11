import 'Kofecar.dart';

void main() {
  Machine machine = Machine(Resources(200, 100, 300, 100));

  print("Заказ: Капучино");
  print(machine.makeCoffee(Cappuccino()));

  print("Заказ: Эспрессо");
  print(machine.makeCoffee(Espresso()));

  print("Заказ: Американо");
  print(machine.makeCoffee(Americano()));
}
