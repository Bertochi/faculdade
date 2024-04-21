import 'dart:io';

void main(List<String> args) {
  print('Valor do salário mínimo:');
  int a = int.parse(stdin.readLineSync().toString());
  print('Valor do salário do usuário:');
  int b = int.parse(stdin.readLineSync().toString());
  double c = b / a;
  print('O usuário ganha $c salários');
}
