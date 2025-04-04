import 'MyCoffee.dart';
import 'Enums.dart';

class Coffee implements ICoffee {
  final CoffeeType _type;

  Coffee(this._type);

  @override
  int coffeeBeans() {
    return {
      CoffeeType.cappuccino: 10,
      CoffeeType.espresso: 8,
      CoffeeType.americano: 6,
    }[_type]!;
  }

  @override
  int milk() {
    return (_type == CoffeeType.cappuccino) ? 50 : 0;
  }

  @override
  int water() {
    return switch (_type) {
      CoffeeType.cappuccino => 50,
      CoffeeType.espresso => 30,
      CoffeeType.americano => 100,
    };
  }

  @override
  int cash() {
    const costMap = {
      CoffeeType.cappuccino: 120,
      CoffeeType.espresso: 100,
      CoffeeType.americano: 80,
    };
    return costMap[_type]!;
  }
}
