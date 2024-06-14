import 'package:estudo_flutter/app/models/historico_cliente_model.dart';
import 'package:estudo_flutter/app/screens/historico_clientes/historico_cliente_controller.dart';
import 'package:estudo_flutter/components/header.dart';
import 'package:estudo_flutter/components/session_title.dart';
import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/default_style.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:estudo_flutter/services/app_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class HistoricoClienteScreen extends StatefulWidget {
  const HistoricoClienteScreen({super.key});

  @override
  State<HistoricoClienteScreen> createState() => _HistoricoClienteScreenState();
}

class _HistoricoClienteScreenState extends State<HistoricoClienteScreen> {
  var configFontSize = FontSize();
  AppService appService = AppService();
  List<DropdownMenuItem<String>> dropdownFiltros = [];
  int _currentPage = 1;
  int get currentPage => _currentPage;
  final _scrollController = ScrollController();

  @override
  void initState() {
    initForm();
  }

  @override
  Widget build(BuildContext context) {
    final equipamentosPesagemController = Provider.of<HistoricoClienteController>(context, listen: false);
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(alturaDoDispositivo * 0.08),
        child: Header(
          title: "Histórico",
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(alturaDoDispositivo * 0.02),
        child: Column(
          children: [
            SessionTitle(title: "Histórico de Clientes"),
            Expanded(
              child: Consumer<HistoricoClienteController>(
                  builder: (context, provider, listHistorico) {
                    return ListView.builder(
                        controller: _scrollController,
                        shrinkWrap: true,
                        itemCount: equipamentosPesagemController.listHistorico.length,
                        itemBuilder: (context,index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: alturaDoDispositivo * 0.03, horizontal: larguraDoDispositivo * 0.03),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(equipamentosPesagemController.listHistorico[index].nome!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: configFontSize.inputLabelSize(larguraDoDispositivo)),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: alturaDoDispositivo * 0.02),
                                  child: Container(
                                    height: alturaDoDispositivo * 0.003,
                                    width: larguraDoDispositivo * 0.9,
                                    color: Colors.black,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text("Data Nascimento: ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsTheme.colorText,
                                      ),
                                    ),
                                    Text(equipamentosPesagemController.listHistorico[index].dataNascimento!,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("CPF: ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsTheme.colorText,
                                      ),
                                    ),
                                    SizedBox(
                                      width: larguraDoDispositivo * 0.6,
                                      child: Tooltip(
                                        message: equipamentosPesagemController.listHistorico[index].cpfCnpj!,
                                        textStyle:  TextStyle(
                                            fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                            fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                            color: Colors.white
                                        ),
                                        child: Text(equipamentosPesagemController.listHistorico[index].cpfCnpj!,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                            fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("Estado: ",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsTheme.colorText,
                                      ),
                                    ),
                                    SizedBox(
                                      width: larguraDoDispositivo * 0.6,
                                      child: Tooltip(
                                        message: equipamentosPesagemController.listHistorico[index].estado!,
                                        textStyle:  TextStyle(
                                            fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                            fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                            color: Colors.white
                                        ),
                                        child: Text(equipamentosPesagemController.listHistorico[index].estado!,
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                                            fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        }
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> exibirModalFiltro(BuildContext context) {
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var configFontSize = FontSize();
    final controller = Provider.of<HistoricoClienteController>(context, listen: false);
    final form = controller.form;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: SessionTitle(title: "Adicionar Filtro"),
          content: SingleChildScrollView(
            child: ReactiveForm(
              formGroup: form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tipo Filtro",
                      style: TextStyle(
                        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                        fontWeight: FontWeight.bold,
                        color: ColorsTheme.colorText,
                      )
                  ),
                  SizedBox(
                    height: alturaDoDispositivo * 0.13,
                    child: ReactiveDropdownField<String>(
                      validationMessages: {
                        'required': (error) => 'Tipo Filtro é obrigatório'
                      },
                      formControlName: 'tipoFiltro',
                      items: dropdownFiltros,
                      style: TextStyle(
                        color: ColorsTheme.colorText,
                        fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                      ),
                      decoration: DefaultStyle.buildInputDecoration(
                          "Selecione o tipo filtro",
                          alturaDoDispositivo,
                          larguraDoDispositivo,
                          false,
                          context
                      ),
                    ),
                  ),
                  Text("Descrição",
                      style: TextStyle(
                        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                        fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                        fontWeight: FontWeight.bold,
                        color: ColorsTheme.colorText,
                      )
                  ),
                  ReactiveTextField(
                    validationMessages: {
                      'required': (error) => 'Descrição é obrigatória'
                    },
                    maxLength: 60,
                    maxLines: null,
                    style: TextStyle(
                      fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                      fontFamily: FontTheme.FUTURA_ROUND_LIGHT,
                    ),
                    formControlName: "descricao",
                    decoration: DefaultStyle.buildInputDecoration(
                        "Informe a descrição",
                        alturaDoDispositivo,
                        larguraDoDispositivo,
                        false,
                        context
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Limpar', style: TextStyle(
                fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                fontFamily: FontTheme.FUTURA_ROUND_BOLD,
              ),
              ),
              onPressed: () {
                controller.form.reset();
              },
            ),
            TextButton(
              child: Text('OK', style: TextStyle(
                fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
                fontFamily: FontTheme.FUTURA_ROUND_BOLD,
              ),
              ),
              onPressed: () async{
                resetPage();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void nextPage() {
    _currentPage++;
    // Atualize a lista com a próxima página de dados
    loadNextPage();
  }

  void resetPage() async {
    // final controller = Provider.of<HistoricoClienteController>(context, listen: false);
    // final form = controller.form;
    // _currentPage = 1;
    // controller.listHistoricoAuditoria = [];
    // List<HistoricoClienteModel> page = //await auditoriaService.getListDetalhesAuditoria(form.control("tipoFiltro")!.value, form.control("descricao")!.value, _currentPage);
    // controller.listHistoricoAuditoria = page;
    // controller.notifyListeners();
    // //Colocando o foco no começo da lista
    // _scrollController.jumpTo(0);
  }

  void loadNextPage() async {
    // final controller = Provider.of<HistoricoClienteController>(context, listen: false);
    // final form = controller.form;
    // List<HistoricoClienteModel> nextPage = //await auditoriaService.getListDetalhesAuditoria(form.control("tipoFiltro")!.value, form.control("descricao")!.value, currentPage);
    // controller.listHistoricoAuditoria.addAll(nextPage);
    // controller.notifyListeners();
  }

  initForm() async{
    final controller = Provider.of<HistoricoClienteController>(context, listen: false);
    controller.listHistorico = appService.listFormModel;
    // controller.notifyListeners();
  }

}
