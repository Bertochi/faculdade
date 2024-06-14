
import 'package:dropdown_search/dropdown_search.dart';
import 'package:estudo_flutter/app/common/array_estados.dart';
import 'package:estudo_flutter/app/custom_masks/custom_mask_cpf.dart';
import 'package:estudo_flutter/app/screens/dados_complementares/dados_complementares_controller.dart';
import 'package:estudo_flutter/components/cutrale_snack_bar.dart';
import 'package:estudo_flutter/components/header.dart';
import 'package:estudo_flutter/components/session_title.dart';
import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/default_style.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:estudo_flutter/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DadosComplementares extends StatefulWidget {
  const DadosComplementares({super.key});

  @override
  State<DadosComplementares> createState() => _DadosComplementaresState();
}

class _DadosComplementaresState extends State<DadosComplementares> {
  var configFontSize = FontSize();
  AppService appService = AppService();
  final _dropEstadosKey = GlobalKey<DropdownSearchState<String>>();
  List<Map<String, dynamic>> listCidades = [];
  List<String> listNomeCidades = [];

  @override
  Widget build(BuildContext context) {
    final dadosComplementaresController = Provider.of<DadosComplementaresController>(context, listen: false);
    final form = dadosComplementaresController.form;
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    var maskFormatter = MaskTextInputFormatter(
        mask: '+# (###) ###-##-##',
        type: MaskAutoCompletionType.lazy
    );

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
            SessionTitle(title: "Dados Complementares"),
            Padding(
              padding: EdgeInsets.only(top: alturaDoDispositivo * 0.04, left: larguraDoDispositivo * 0.05, right: larguraDoDispositivo * 0.05),
              child: ReactiveForm(
                formGroup: form,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("CPF/CNPJ-IE",
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
                          'CPF/CNPJ-IE é obrigatório'
                        },
                        inputFormatters: [
                          CustomMaskCpf()
                        ],
                        style: TextStyle(
                          fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                        ),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        formControlName: "cpfCnpj",
                        decoration: DefaultStyle.buildInputDecoration(
                            "Informe o CPF/CNPJ-IE",
                            alturaDoDispositivo,
                            larguraDoDispositivo,
                            false,
                            context
                        ),
                      ),
                    ),
                    Text("Endereço",
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
                          'required': (error) => 'Endereço é obrigatório'
                        },
                        style: TextStyle(
                          fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                        ),
                        maxLength: 40,
                        formControlName: "endereco",
                        decoration: DefaultStyle.buildInputDecoration(
                            "Informe o endereço",
                            alturaDoDispositivo,
                            larguraDoDispositivo,
                            false,
                            context
                        ),
                      ),
                    ),
                    Text("Estado",
                        style: TextStyle(
                          fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                          fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.colorText,
                        )
                    ),
                    SizedBox(
                      height: alturaDoDispositivo * 0.14,
                      child: DropdownSearch<String>(
                        items: ArrayEstados.siglasEstado,
                        key: _dropEstadosKey,
                        popupProps: PopupPropsMultiSelection.modalBottomSheet(
                          showSelectedItems: true,
                          itemBuilder: _customPopupItemBuilderEstados,
                          showSearchBox: true,
                        ),
                        dropdownBuilder: _customDropDownBuilderEstados,
                        dropdownButtonProps: const DropdownButtonProps(
                            isVisible: false
                        ),
                        dropdownDecoratorProps: DropDownDecoratorProps(
                          baseStyle: TextStyle(
                              fontSize: configFontSize.inputTextSize(larguraDoDispositivo)
                          ),
                          dropdownSearchDecoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(0),
                          ),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            form.control("estado")!.value = value;
                          }
                        },
                      ),
                    )
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

  Widget _customDropDownBuilderEstados(BuildContext context, String? selectedItem) {
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    return ReactiveTextField(
      validationMessages: {
        'required': (error) => 'Estado é obrigatório'
      },
      readOnly: true,
      style: TextStyle(
        fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
      ),
      decoration: DefaultStyle.buildInputDecoration(
          "Selecione o estado",
          alturaDoDispositivo,
          larguraDoDispositivo,
          false,
          context),
      maxLength: 40,
      formControlName: "estado",
      onTap: (_) {
        _dropEstadosKey.currentState?.openDropDownSearch();
      },
    );
  }

  Widget _customPopupItemBuilderEstados(BuildContext context, String? item, bool isSelected) {
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: larguraDoDispositivo * 0.014),
      child: ListTile(
        selected: isSelected,
        title: Wrap(children: [
          Text(item!, style: TextStyle(
              fontSize: configFontSize.inputTextSize(larguraDoDispositivo))),
        ]),
        leading: const CircleAvatar(
          child: Icon(Icons.apple),
        ),
      ),
    );
  }

  submitForm(BuildContext context) {
    var form = Provider.of<DadosComplementaresController>(context, listen: false).form;
    if(form.valid) {
      String estado = form.control("estado").value;
      appService.formModel.cpfCnpj = form.control("cpfCnpj").value;
      appService.formModel.endereco = form.control("endereco").value;
      appService.formModel.estado = estado.substring(0,2);
      appService.listFormModel.add(appService.formModel);
      CutraleSnackBar.show(
          context: context,
          message: 'Cliente Salvo!',
          tipoMensagem: CutraleSnackTipoMensagem.success);
      Navigator.pushNamedAndRemoveUntil(context, '/menu', (Route<dynamic> route) => false);
    } else {
      form.markAllAsTouched();
    }
  }

}