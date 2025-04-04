class Resources {
  int coffeeBeans;
  int milk;
  int water;
  int cash;

  Resources({
    this.coffeeBeans = 0,
    this.milk = 0,
    this.water = 0,
    this.cash = 0,
  });

  int getResource(String resourceName) {
    final resourceMap = {
      'coffeeBeans': coffeeBeans,
      'milk': milk,
      'water': water,
      'cash': cash,
    };
    return resourceMap[resourceName] ?? 0;
  }

  void setResource(String resourceName, int value) {
    switch (resourceName) {
      case 'coffeeBeans':
        coffeeBeans = value;
        break;
      case 'milk':
        milk = value;
        break;
      case 'water':
        water = value;
        break;
      case 'cash':
        cash = value;
        break;
      default:
        // игнорируем несуществующие ресурсы
        break;
    }
  }
}
