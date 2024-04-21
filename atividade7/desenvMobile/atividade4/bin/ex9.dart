import 'dart:io';

void main(List<String> args) {
  print('Nota 1:');
  double a = double.parse(stdin.readLineSync().toString());
  print('Nota 2:');
  double b = double.parse(stdin.readLineSync().toString());
  print('Nota 3:');
  double c = double.parse(stdin.readLineSync().toString());
  double media = (a + b + c) / 3;
  print('Média: $media');
}
