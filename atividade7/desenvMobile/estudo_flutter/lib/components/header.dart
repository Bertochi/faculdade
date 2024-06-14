import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/config/font_size.dart';
import 'package:estudo_flutter/config/font_theme.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Header({Key? key, required this.title}) : super(key: key);
  final String title;
  var configFontSize = FontSize();

  @override
  Widget build(BuildContext context) {
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;

    return AppBar(
      iconTheme: const IconThemeData(
          color: Colors.white,
      ),
      elevation: 0,
      backgroundColor: ColorsTheme.colorHeader,
      title: Row(
        children: <Widget>[
        Icon(
        Icons.menu,
        color: Colors.white,
        size: alturaDoDispositivo * 0.04,
      ),
      Padding(
        padding: EdgeInsets.only(left: alturaDoDispositivo * 0.03),
        child: Text(title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: FontTheme.FUTURA_ROUND_BOLD,
              fontSize: alturaDoDispositivo * 0.03,
            ),
        ),
      )
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.wifi,
            color: Colors.white,
            size: alturaDoDispositivo * 0.04,
          ),
          onPressed: () {

          },
        ),
        IconButton(
          icon: Icon(
            Icons.exit_to_app,
            color: Colors.white,
            size: alturaDoDispositivo * 0.04,
          ),
          onPressed: () {
            Navigator.pushNamed(context, "/menu");
          },
        ),
      ],
    );
  }
}