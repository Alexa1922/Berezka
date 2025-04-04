import 'Resources.dart';
import 'MyCoffee.dart';
import 'Coffee.dart';
import 'Enums.dart';

class Machine {
  Resources resources = Resources();

  void fillResources(int beans, int milk, int water) {
    final updated = [beans, milk, water];
    resources
      ..coffeeBeans += updated[0]
      ..milk += updated[1]
      ..water += updated[2];
  }

  bool isAvailableResources(ICoffee coffee) {
    final available = [
      resources.coffeeBeans - coffee.coffeeBeans(),
      resources.milk - coffee.milk(),
      resources.water - coffee.water(),
    ];
    return available.every((e) => e >= 0);
  }

  int buyCoffee(CoffeeType type, int userMoney) {
    ICoffee coffee = Coffee(type);

    if (!isAvailableResources(coffee)) return -1;

    if (!_hasEnoughMoney(userMoney, coffee)) return -2;

    makeCoffee(coffee);
    resources.cash += coffee.cash();

    return userMoney - coffee.cash();
  }

  bool _hasEnoughMoney(int money, ICoffee coffee) => money >= coffee.cash();

  void makeCoffee(ICoffee coffee) {
    List<void Function()> actions = [
      () => resources.coffeeBeans -= coffee.coffeeBeans(),
      () => resources.milk -= coffee.milk(),
      () => resources.water -= coffee.water(),
    ];
    actions.forEach((action) => action());

    print('Кофе готов! Приятного дня!');
  }
}
