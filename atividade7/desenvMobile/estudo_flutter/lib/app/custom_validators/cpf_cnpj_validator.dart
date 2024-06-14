import 'package:reactive_forms/reactive_forms.dart';

class CpfValidator extends Validator<dynamic>{
  const CpfValidator() : super();
  final cpfLength = 11;

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if(control.isNull) {
      return null;
    }
    bool isValid;
    String controlSemMask = control.value.replaceAll(RegExp(r'[^0-9]'), '');
    if(controlSemMask.length == 11){
      isValid = isValidCpf(controlSemMask);
      return isValid == true ? null : {'CPF inválido': true};

    } else{
      return {'Formato inválido': true};
    }
  }

  bool isValidCpf(String cpf){

    if(validaNumerosIguais(cpf) == false){
      return false;
    }

    int sum = 0;
    for (int i = 0; i < 9; i++) {
      sum += int.parse(cpf[i]) * (10 - i);
    }
    int firstVerifier = 11 - (sum % 11);
    if (firstVerifier >= 10) {
      firstVerifier = 0;
    }
    if (int.parse(cpf[9]) != firstVerifier) {
      return false;
    }

    sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(cpf[i]) * (11 - i);
    }
    int secondVerifier = 11 - (sum % 11);
    if (secondVerifier >= 10) {
      secondVerifier = 0;
    }
    if (int.parse(cpf[10]) != secondVerifier) {
      return false;
    }

    return true;
  }

  bool validaNumerosIguais(String cpf){
    if (cpf == '00000000000' ||
        cpf == '11111111111' ||
        cpf == '22222222222' ||
        cpf == '33333333333' ||
        cpf == '44444444444' ||
        cpf == '55555555555' ||
        cpf == '66666666666' ||
        cpf == '77777777777' ||
        cpf == '88888888888' ||
        cpf == '99999999999') {
      return false;
    }
    return true;
  }

}