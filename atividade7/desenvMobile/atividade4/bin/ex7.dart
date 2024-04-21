import 'dart:io';

void main(List<String> args) {
  print('Valor de a:');
  int a = int.parse(stdin.readLineSync().toString());
  print('Valor de b:');
  int b = int.parse(stdin.readLineSync().toString());
  print('Valor de c:');
  int c = int.parse(stdin.readLineSync().toString());

  if (a >= b && a >= c) {
    print('$a');
    if (b >= c) {
      print('$b');
      print('$c');
    } else {
      print('$c');
      print('$b');
    }
  }
  if (b >= a && b >= c) {
    print('$b');
    if (a >= c) {
      print('$a');
      print('$c');
    } else {
      print('$c');
      print('$a');
    }
  }
  if (c >= a && c >= b) {
    print('$c');
    if (a >= b) {
      print('$a');
      print('$b');
    } else {
      print('$b');
      print('$a');
    }
  }
}
