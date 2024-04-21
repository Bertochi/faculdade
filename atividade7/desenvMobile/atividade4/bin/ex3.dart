import 'dart:io';

void main(List<String> args) {
  print('Valor:');
  int a = int.parse(stdin.readLineSync().toString());
  int antecessor = a - 1;
  int sucessor = a + 1;
  print('Antecessor: $antecessor');
  print('Sucessor: $sucessor');
}
