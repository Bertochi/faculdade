import 'dart:io';

void main(List<String> args) {
  print('Peso:');
  double a = double.parse(stdin.readLineSync().toString());
  print('Altura:');
  double b = double.parse(stdin.readLineSync().toString());
  double imc = a / (b * b);
  if (imc <= 18.5) {
    print('Abaixo do peso');
  } else if (imc >= 18.6 && imc <= 24.9) {
    print('Peso ideal (parabéns)');
  } else if (imc >= 25 && imc <= 29.9) {
    print('Levemente acima do peso');
  } else if (imc >= 30 && imc <= 34.9) {
    print('Obesidade grau I');
  } else if (imc >= 35 && imc <= 39.9) {
    print('Obesidade grau II (severa)');
  } else if (imc >= 40) {
    print('Obesidade grau III (mórbida)');
  }
}
