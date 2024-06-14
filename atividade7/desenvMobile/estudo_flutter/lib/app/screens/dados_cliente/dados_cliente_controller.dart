import 'package:flutter/cupertino.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DadosClienteController extends ChangeNotifier {

  final form = FormGroup({
    "dataNascimento": FormControl<String>(validators: [Validators.required]),
    "nome": FormControl<String>(validators: [Validators.required]),
  });

}