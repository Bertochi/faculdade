import 'dart:io';

void main(List<String> args) {
  print('Valor:');
  int a = int.parse(stdin.readLineSync().toString());
  if (a % 2 == 0) {
    print('Numero par');
  } else {
    print('Numero impar');
  }
  if (a >= 0) {
    print('Numero positivo');
  } else {
    print('Numero negativo');
  }
}
