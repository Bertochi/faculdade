import 'dart:io';

void main(List<String> args) {
  print('Digite seu nome:');
  String nome = stdin.readLineSync().toString();
  print('Nota 1:');
  double a = double.parse(stdin.readLineSync().toString());
  print('Nota 2:');
  double b = double.parse(stdin.readLineSync().toString());
  print('Nota 3:');
  double c = double.parse(stdin.readLineSync().toString());
  print('Nota 4:');
  double d = double.parse(stdin.readLineSync().toString());
  double media = (a + b + c + d) / 4;

  if (media >= 7) {
    print('\nAluno:$nome \nAprovado');
  } else {
    print('\nAluno:$nome \nReprovado');
  }
}
