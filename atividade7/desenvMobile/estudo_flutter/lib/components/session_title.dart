import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:flutter/material.dart';

class SessionTitle extends StatelessWidget {
  String title;
  SessionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    var configFontSize = FontSize();
    return Padding(
      padding: EdgeInsets.all(alturaDoDispositivo * 0.02),
      child: Container(
        alignment: Alignment.center,
        height: alturaDoDispositivo * 0.06,
        width: larguraDoDispositivo * 0.96,
        decoration: BoxDecoration(
            color: ColorsTheme.primaryColorOrange,
            borderRadius: BorderRadius.circular(alturaDoDispositivo * 0.02)
        ),
        child: Text(title,
          style: TextStyle(
            fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
            fontFamily: FontTheme.FUTURA_ROUND_BOLD,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
