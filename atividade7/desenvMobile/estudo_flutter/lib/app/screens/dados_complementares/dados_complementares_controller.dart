import 'package:estudo_flutter/app/custom_validators/cpf_cnpj_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DadosComplementaresController extends ChangeNotifier {

  final form = FormGroup({
    "cpfCnpj": FormControl<String>(validators: [Validators.required, const CpfValidator()]),
    "endereco": FormControl<String>(validators: [Validators.required]),
    "estado": FormControl<String>(validators: [Validators.required]),
  });
}