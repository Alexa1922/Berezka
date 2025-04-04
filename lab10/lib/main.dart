import 'dart:io';
import 'Machine.dart';
import 'Enums.dart';

void main() {
  final machine = Machine();
  machine.fillResources(100, 200, 300);

  int? money = _getInputAsInt('Сколько денег вы внесли: ');
  if (money == null) {
    _showError('Ошибка: введите корректную сумму.');
    return;
  }

  CoffeeType? selected = _selectCoffeeType();
  if (selected == null) {
    _showError('Ошибка: выбран несуществующий вариант.');
    return;
  }

  final change = machine.buyCoffee(selected, money);
  _handleTransactionResult(change);

  _printRemainingResources(machine);
}

int? _getInputAsInt(String prompt) {
  stdout.write(prompt);
  return int.tryParse(stdin.readLineSync() ?? '');
}

CoffeeType? _selectCoffeeType() {
  final menu = {
    1: CoffeeType.cappuccino,
    2: CoffeeType.espresso,
    3: CoffeeType.americano,
  };

  print('Выберите кофе:');
  menu.forEach((key, value) {
    final price =
        {
          CoffeeType.cappuccino: 120,
          CoffeeType.espresso: 100,
          CoffeeType.americano: 80,
        }[value];
    print('$key - ${value.name} ($price)');
  });

  final selection = _getInputAsInt('Ваш выбор: ');
  return menu[selection];
}

void _handleTransactionResult(int result) {
  switch (result) {
    case -1:
      _showError('Недостаточно ресурсов для приготовления.');
      break;
    case -2:
      _showError('Недостаточно средств для покупки.');
      break;
    default:
      print('Напиток готов. Сдача: $result');
  }
}

void _showError(String message) => print('\n❌ $message');

void _printRemainingResources(Machine machine) {
  print('\n📦 Остатки ресурсов:');
  print('Бобы: ${machine.resources.coffeeBeans}');
  print('Молоко: ${machine.resources.milk}');
  print('Вода: ${machine.resources.water}');
  print('Доход: ${machine.resources.cash}');
}
