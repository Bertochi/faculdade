import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  ItemMenu({super.key, required this.title, required this.icon, required this.rota});
  String title;
  IconData icon;
  String rota;

  @override
  Widget build(BuildContext context) {
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    var configFontSize = FontSize();
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(alturaDoDispositivo * 0.01)),
      ),
      color: ColorsTheme.primaryColorBlue,
      child: InkWell(
        splashColor: ColorsTheme.secondColorBlueCyan,
        onTap: () => {
          Navigator.pushNamed(context, rota),
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
                    Icon(icon,
                      size: alturaDoDispositivo * 0.09,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: alturaDoDispositivo * 0.01),
                      child: Text(title,
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
    );
  }
}
