import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:flutter/material.dart';

class BtnNextPage extends StatelessWidget {
  BtnNextPage({super.key, required this.rota});
  String rota;

  @override
  Widget build(BuildContext context) {
    var alturaDoDispositivo = MediaQuery.of(context).size.height;
    var larguraDoDispositivo = MediaQuery.of(context).size.width;
    return SizedBox(
      width: larguraDoDispositivo * 0.11,
      height: alturaDoDispositivo * 0.11,
      child: FloatingActionButton(
        backgroundColor: ColorsTheme.primaryColorBlue,
        onPressed: () {
          Navigator.pushNamed(context, rota);
        },
        child: Icon(Icons.arrow_forward, color: Colors.white, size: larguraDoDispositivo * 0.06),
      ),
    );
  }
}
