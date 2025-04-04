import 'dart:async';

class CoffeeProcess {
  static Future<void> heatWater() async {
    print('start_process: water');
    await Future.delayed(const Duration(seconds: 3));
    print('done_process: water');
  }

  static Future<void> brewCoffee() async {
    print('start_process: espresso');
    await Future.delayed(const Duration(seconds: 5));
    print('done_process: coffee with water');
  }

  static Future<void> frothMilk() async {
    print('start_process: milk');
    await Future.delayed(const Duration(seconds: 5));
    print('done_process: milk');
  }

  static Future<void> mixCoffeeAndMilk() async {
    print('start_process: mixing coffee and milk');
    await Future.delayed(const Duration(seconds: 3));
    print('done_process: cappuccino');
  }
}
