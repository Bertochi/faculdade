import 'dart:io';

void main(List<String> args) {
  print('Valor:');
  int a = int.parse(stdin.readLineSync().toString());
  double b = a * 0.05;
  double aa = a + b;
  double ab = a - b;
  print('Reajuste de mais 5%: $aa');
  print('Reajuste de menos 5%: $ab');
}
