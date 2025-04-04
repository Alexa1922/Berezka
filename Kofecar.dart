enum CoffeeType { espresso, cappuccino, americano }

class Resources {
  double coffeeBeans;
  double milk;
  double water;
  double cash;

  Resources(this.coffeeBeans, this.milk, this.water, this.cash);

  bool hasEnough(Resources required) {
    return coffeeBeans >= required.coffeeBeans &&
        milk >= required.milk &&
        water >= required.water &&
        cash >= required.cash;
  }

  void subtract(Resources required) {
    coffeeBeans -= required.coffeeBeans;
    milk -= required.milk;
    water -= required.water;
    cash -= required.cash;
  }
}

abstract class ICoffee {
  Resources get requiredResources;
  String get name;
}

class Espresso implements ICoffee {
  @override
  Resources get requiredResources => Resources(50, 0, 30, 20);

  @override
  String get name => "Эспрессо";
}

class Cappuccino implements ICoffee {
  @override
  Resources get requiredResources => Resources(60, 50, 100, 50);

  @override
  String get name => "Капучино";
}

class Americano implements ICoffee {
  @override
  Resources get requiredResources => Resources(40, 0, 150, 30);

  @override
  String get name => "Американо";
}

class Machine {
  Resources _resources;

  Machine(this._resources);

  void addResources(Resources extra) {
    _resources.coffeeBeans += extra.coffeeBeans;
    _resources.milk += extra.milk;
    _resources.water += extra.water;
    _resources.cash += extra.cash;
  }

  String makeCoffee(ICoffee coffee) {
    if (_resources.hasEnough(coffee.requiredResources)) {
      _resources.subtract(coffee.requiredResources);
      return "${coffee.name} готов!";
    }
    return "Недостаточно ресурсов для приготовления ${coffee.name}.";
  }
}
