import 'dart:io';

void main(List<String> args) {
  print('true/false');
  print('Valor:');
  bool a = bool.parse(stdin.readLineSync().toString());
  print('Valor:');
  bool b = bool.parse(stdin.readLineSync().toString());

  if (a != b) {
    print('Valores diferentes');
  }
  if (a == true && b == true) {
    print('Ambos são true');
  }
  if (a == false && b == false) {
    print('Ambos são false');
  }
}
