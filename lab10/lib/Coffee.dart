import 'MyCoffee.dart';
import 'Enums.dart';

class Coffee implements ICoffee {
  final CoffeeType _type;

  Coffee(this._type);

  @override
  int coffeeBeans() {
    return _getIngredient({
      CoffeeType.cappuccino: 10,
      CoffeeType.espresso: 8,
      CoffeeType.americano: 6,
    });
  }

  @override
  int milk() {
    return (_type == CoffeeType.cappuccino) ? 50 : 0;
  }

  @override
  int water() {
    if (_type == CoffeeType.espresso) return 30;
    if (_type == CoffeeType.cappuccino) return 50;
    return 100;
  }

  @override
  int cash() {
    Map<CoffeeType, int> prices = {
      CoffeeType.espresso: 100,
      CoffeeType.cappuccino: 120,
      CoffeeType.americano: 80,
    };
    return prices[_type]!;
  }

  int _getIngredient(Map<CoffeeType, int> table) {
    return table[_type] ?? 0;
  }
}
