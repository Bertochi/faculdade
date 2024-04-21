import 'dart:io';

void main(List<String> args) {
  print('Valor de A:');
  int a = int.parse(stdin.readLineSync().toString());
  print('Valor de B:');
  int b = int.parse(stdin.readLineSync().toString());
  print('Valor de C:');
  int c = int.parse(stdin.readLineSync().toString());
  int soma = a + b;
  print('A+B: $soma');

  if (soma > c) {
    print('A+B>C');
  } else {
    print('A+B<=C');
  }
}
