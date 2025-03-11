class Machine {
  double _coffeeBeans;
  double _milk;
  double _water;
  double _cash;

  Machine(this._coffeeBeans, this._milk, this._water, this._cash);

  double get coffeeBeans => _coffeeBeans;
  set coffeeBeans(double value) => _coffeeBeans = value;

  double get milk => _milk;
  set milk(double value) => _milk = value;

  double get water => _water;
  set water(double value) => _water = value;

  double get cash => _cash;
  set cash(double value) => _cash = value;

  bool _isAvailableRessources(coffee,milk,water,cash){
    return _coffeeBeans >= coffee && _milk >= milk && _water >= water && _cash >=cash;
  }

  void setResource(value){
    _coffeeBeans += value;
    _milk += value;
    _water += value;
    _cash += value;
  }

  void _subtractResources(coffee,milk,water,cash) {
    _coffeeBeans -= coffee;
    _water -= water;
    _milk -= milk;
    _cash -= cash;
  }

  // Приготовление эспрессо
  String makingCoffee(coffee,milk,water,cash,type) {
    if (_isAvailableRessources(coffee, milk, water, cash)) {
      _subtractResources(coffee,milk,water,cash);
      return "${type} готов!";
    }
    return "Недостаточно ресурсов для приготовления ${type}.";
  }
}
