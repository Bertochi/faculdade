import 'package:estudo_flutter/app/models/form_model.dart';
import 'package:estudo_flutter/app/models/historico_cliente_model.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HistoricoClienteController extends ChangeNotifier {
  final form = FormGroup({
    "tipoFiltro": FormControl<String>(validators: [Validators.required]),
    "descricao": FormControl<String>(validators: [Validators.required]),
  });

  List<FormModel> listHistorico = [];
}