import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:flutter/material.dart';

class DefaultStyle{

  static InputDecoration buildInputDecoration(String hintText, double altura, double largura, bool isInputData, BuildContext context) {
    var configFontSize = FontSize();
    var larguraDoDispositivo = MediaQuery.of(context).size.width;

    return InputDecoration(
      suffixIcon: isInputData ? const Icon(Icons.calendar_today, color: ColorsTheme.colorBorderInput) : null,
      errorStyle: TextStyle(
        fontSize: configFontSize.inputTextSize(largura),
      ),
      counterText: "",
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: configFontSize.inputLabelSize(larguraDoDispositivo),
      ),
      contentPadding: EdgeInsets.all(altura * 0.02),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: ColorsTheme.colorBorderInput),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide:
        const BorderSide(color: ColorsTheme.colorBorderInput),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
        const BorderSide(color: ColorsTheme.colorBorderInput),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }

}