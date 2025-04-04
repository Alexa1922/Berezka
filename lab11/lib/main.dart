import 'dart:io';
import 'Machine.dart';
import 'Enums.dart';

Future<void> main() async {
  final coffeeMachine = Machine();

  coffeeMachine.fillResources(100, 200, 300);

  stdout.write('Введите сумму: ');
  final inputMoney = stdin.readLineSync();
  final userMoney = int.tryParse(inputMoney ?? '');

  if (userMoney == null) {
    print('❌ Некорректный ввод суммы');
    return;
  }

  print('\nВыберите тип кофе:');
  print('1 - Cappuccino (120)');
  print('2 - Espresso   (100)');
  print('3 - Americano  (80)');
  stdout.write('Ваш выбор: ');

  final inputChoice = stdin.readLineSync();
  final choice = int.tryParse(inputChoice ?? '');

  if (choice == null) {
    print('❌ Некорректный ввод.');
    return;
  }

  final selectedType = switch (choice) {
    1 => CoffeeType.cappuccino,
    2 => CoffeeType.espresso,
    3 => CoffeeType.americano,
    _ => null,
  };

  if (selectedType == null) {
    print('❌ Некорректный выбор.');
    return;
  }

  final result = await coffeeMachine.buyCoffee(selectedType, userMoney);

  switch (result) {
    case -1:
      print('⚠️ Недостаточно ресурсов для приготовления выбранного кофе.');
      break;
    case -2:
      print('💸 Недостаточно денег. Нужно больше средств!');
      break;
    default:
      print('✅ Кофе готов! Ваша сдача: $result');
  }

  print('\n📦 Остаток ресурсов:');
  print('Кофейные зёрна: ${coffeeMachine.resources.coffeeBeans}');
  print('Молоко: ${coffeeMachine.resources.milk}');
  print('Вода: ${coffeeMachine.resources.water}');
  print('Касса (заработано): ${coffeeMachine.resources.cash}');
}
