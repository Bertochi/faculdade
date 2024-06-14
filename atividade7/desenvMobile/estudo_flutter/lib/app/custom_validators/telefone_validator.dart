import 'package:reactive_forms/reactive_forms.dart';

class TelefoneValidator extends Validator<dynamic>{
  const TelefoneValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if(control.isNull) {
      return null;
    }
    String controlSemMask = control.value.replaceAll(RegExp(r'[^0-9]'), '');
    if(controlSemMask.length == 11){
      return null;
    } else {
      return {'Formato inválido': true};
    }
  }

}