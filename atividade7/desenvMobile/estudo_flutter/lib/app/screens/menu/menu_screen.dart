import 'package:estudo_flutter/components/header.dart';
import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:estudo_flutter/services/app_service.dart';
import 'package:flutter/material.dart';


class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  var configFontSize = FontSize();
  AppService appService = AppService();

  @override
  Widget build(BuildContext context) {
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(alturaDoDispositivo * 0.08),
        child: Header(
          title: "App Clientes",
        ),
      ),
      body: Column(
        children: [
          GridView.count(
              padding: EdgeInsets.all(alturaDoDispositivo * 0.015),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3,
              children: <Widget> [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: ColorsTheme.primaryColorBlue,
                  child: InkWell(
                    splashColor: ColorsTheme.secondColorBlueCyan,
                    onTap: () => {
                      Navigator.pushNamed(context, "/dadosCliente"),
                    },
                    child: Padding(
                      padding: EdgeInsets.all(alturaDoDispositivo * 0.01),
                      child: SizedBox(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Column(
                              children:[
                                Icon(Icons.file_copy,
                                  size: alturaDoDispositivo * 0.06,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: alturaDoDispositivo * 0.01),
                                  child: Text("Cadastrar",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontTheme.FUTURA_ROUND_BOLD,
                                      color: Colors.white,
                                      fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: ColorsTheme.primaryColorBlue,
                  child: InkWell(
                    splashColor: ColorsTheme.secondColorBlueCyan,
                    onTap: () => {
                      Navigator.pushNamed(context, "/historicoCliente"),
                    },
                    child: Padding(
                      padding: EdgeInsets.all(alturaDoDispositivo * 0.01),
                      child: SizedBox(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: [
                            Column(
                              children:[
                                Icon(Icons.history,
                                  size: alturaDoDispositivo * 0.06,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: alturaDoDispositivo * 0.01),
                                  child: Text("Usuarios",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: FontTheme.FUTURA_ROUND_BOLD,
                                      color: Colors.white,
                                      fontSize: configFontSize.inputTextSize(larguraDoDispositivo),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ],
      ),
    );
  }
}
