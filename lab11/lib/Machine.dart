import 'Resources.dart';
import 'MyCoffee.dart';
import 'Coffee.dart';
import 'Enums.dart';
import 'CoffeeProcess.dart';

class Machine {
  Resources resources = Resources();

  void fillResources(int beans, int milk, int water) {
    resources.coffeeBeans += beans;
    resources.milk += milk;
    resources.water += water;
  }

  bool isAvailableResources(ICoffee coffee) {
    return resources.coffeeBeans >= coffee.coffeeBeans() &&
        resources.milk >= coffee.milk() &&
        resources.water >= coffee.water();
  }

  Future<int> buyCoffee(CoffeeType type, int userMoney) async {
    final coffee = Coffee(type);

    if (!isAvailableResources(coffee)) return -1;
    if (userMoney < coffee.cash()) return -2;

    await makeCoffee(coffee);

    resources.cash += coffee.cash();
    return userMoney - coffee.cash();
  }

  Future<void> makeCoffee(ICoffee coffee) async {
    print('_start_');
    await CoffeeProcess.heatWater();
    print('_then_');
    await Future.wait([CoffeeProcess.brewCoffee(), CoffeeProcess.frothMilk()]);
    await CoffeeProcess.mixCoffeeAndMilk();
    print('_end_');

    resources.coffeeBeans -= coffee.coffeeBeans();
    resources.milk -= coffee.milk();
    resources.water -= coffee.water();
    print('Кофе готов! Приятного дня!');
  }
}
