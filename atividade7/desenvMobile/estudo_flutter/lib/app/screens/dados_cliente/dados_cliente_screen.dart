import 'package:estudo_flutter/app/models/form_model.dart';
import 'package:estudo_flutter/app/screens/dados_cliente/dados_cliente_controller.dart';
import 'package:estudo_flutter/components/header.dart';
import 'package:estudo_flutter/components/session_title.dart';
import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/default_style.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:estudo_flutter/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DadosCliente extends StatefulWidget {
  const DadosCliente({super.key});

  @override
  State<DadosCliente> createState() => _DadosArmazemState();
}

class _DadosArmazemState extends State<DadosCliente> {
  var configFontSize = FontSize();
  AppService appService = AppService();

  @override
  Widget build(BuildContext context) {
    final dadosArmazemController = Provider.of<DadosClienteController>(context, listen: false);
    final form = dadosArmazemController.form;
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(alturaDoDispositivo * 0.08),
        child: Header(
          title: "App Clientes",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SessionTitle(title: "Dados do Cliente"),
            Padding(
              padding: EdgeInsets.only(top: alturaDoDispositivo * 0.04, left: larguraDoDispositivo * 0.05, right: larguraDoDispositivo * 0.05),
              child: ReactiveForm(
                formGroup: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome Completo",
                        style: TextStyle(
                          fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.colorText,
                        )
                    ),
                    SizedBox(
                      height: alturaDoDispositivo * 0.14,
                      child: ReactiveTextField(
                        validationMessages: {
                          'required': (error) =>
                          'Nome Completo é obrigatório'
                        },
                        style: TextStyle(
                          fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                        ),
                        maxLength: 40,
                        autofocus: false,
                        formControlName: "nome",
                        decoration: DefaultStyle.buildInputDecoration(
                            "Informe o nome completo",
                            alturaDoDispositivo,
                            larguraDoDispositivo,
                            false,
                            context
                        ),
                      ),
                    ),
                    Text("Data Nascimento",
                          style: TextStyle(
                          fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.colorText,
                        )
                    ),
                    SizedBox(
                      height: alturaDoDispositivo * 0.14,
                      child: ReactiveTextField(
                        readOnly: true,
                         validationMessages: {
                          'required': (
                              error) => 'Data de Nascimento é obrigatória'
                        },
                        style: TextStyle(
                          fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                        ),
                        autofocus: false,
                        formControlName: "dataNascimento",
                        decoration: DefaultStyle.buildInputDecoration(
                            "Informe a Data de Nascimento",
                            alturaDoDispositivo,
                            larguraDoDispositivo,
                            true,
                            context
                        ),
                        onTap: (_) async {
                          DateTime? dataValue = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1950),
                              lastDate: DateTime(2025));

                          if(dataValue != null){
                            form.controls["dataNascimento"]!.value = DateFormat('dd/MM/yyyy').format(dataValue);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: larguraDoDispositivo * 0.11,
        height: alturaDoDispositivo * 0.11,
        child: FloatingActionButton(
          backgroundColor: ColorsTheme.primaryColorBlue,
          onPressed: () {
            submitForm(context);
          },
          child: Icon(Icons.arrow_forward, color: Colors.white, size: larguraDoDispositivo * 0.06),
        ),
      ),
    );
  }

  void submitForm(BuildContext context) {
    var form = Provider.of<DadosClienteController>(context, listen: false).form;
    if(form.valid) {
      appService.formModel.nome = form.control("nome").value;
      appService.formModel.dataNascimento = form.control("dataNascimento").value;
      Navigator.pushNamed(context, "/dadosComplementares");
    } else {
      form.markAllAsTouched();
    }
  }

}
