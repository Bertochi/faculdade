import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:flutter/material.dart';

enum CutraleSnackTipoMensagem {erro, success, info}

class CutraleSnackBar {static show({required BuildContext context, required String message, required CutraleSnackTipoMensagem tipoMensagem, int? duration}) {
  FontSize fontSize = FontSize();
  var larguraDoDispositivo = MediaQuery.of(context).size.width;
  colorByTipoMensagem(){
    TipoMensagem result;
    switch (tipoMensagem) {
      case CutraleSnackTipoMensagem.erro:
        result = TipoMensagem(
            colorBackground: Colors.red.shade600,
            icon: const Icon
              (
                Icons.error_outline,
                color: Colors.white,
                size: 30
            ),
            textStyle: TextStyle(color: Colors.white, fontSize: fontSize.inputLabelSize(larguraDoDispositivo))
        );
        break;
      case CutraleSnackTipoMensagem.success:
        result = TipoMensagem(colorBackground: Colors.green.shade800,
            icon: const Icon
              (
                Icons.check_circle_outline,
                color: Colors.white,
                size: 30
            ),
            textStyle: TextStyle(color: Colors.white, fontSize: fontSize.inputLabelSize(larguraDoDispositivo))
        );
        break;
      case CutraleSnackTipoMensagem.info:
        result = TipoMensagem(colorBackground: ColorsTheme.secondColorLightOrange,
            icon: const Icon
              (
                Icons.info_outline,
                color: Colors.black,
                size: 30
            ),
            textStyle: TextStyle(color: Colors.black, fontSize: fontSize.inputLabelSize(larguraDoDispositivo))
        );
        break;
      default:
        result = TipoMensagem(colorBackground: Colors.grey.shade700,
            icon: const Icon
              (
                Icons.info_outline,
                color: Colors.white,
                size: 30
            ),
            textStyle: TextStyle(color: Colors.black, fontSize: fontSize.inputLabelSize(larguraDoDispositivo))
        );
    }
    return result;
  }


  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0.0,
      //behavior: SnackBarBehavior.floating,
      content: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        children: <Widget>[
          Center(
              child:
              colorByTipoMensagem().icon
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                message,
                style: colorByTipoMensagem().textStyle,
              ),
            ),
          ),
        ],
      ),
      duration: Duration(seconds: duration ?? 3),
      backgroundColor: colorByTipoMensagem().colorBackground,
    ),
  );
}
}


class TipoMensagem {
  Color colorBackground;
  Icon icon;
  TextStyle textStyle;
  TipoMensagem({
    required this.colorBackground,
    required this.icon,
    required this.textStyle,
  });

}