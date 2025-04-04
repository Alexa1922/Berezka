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
    switch (resourceName) {
      case 'coffeeBeans':
        return coffeeBeans;
      case 'milk':
        return milk;
      case 'water':
        return water;
      case 'cash':
        return cash;
      default:
        return 0;
    }
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
        break;
    }
  }
}
