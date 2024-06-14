import 'package:estudo_flutter/app/screens/dados_cliente/dados_cliente_screen.dart';
import 'package:estudo_flutter/app/screens/dados_complementares/dados_complementares_screen.dart';
import 'package:estudo_flutter/app/screens/historico_clientes/historico_cliente_screen.dart';
import 'package:estudo_flutter/app/screens/menu/menu_screen.dart';
import 'package:estudo_flutter/config/colors_theme.dart';
import 'package:estudo_flutter/provider/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.remove();
  runApp(MultiProvider(
      providers: providers,
      child: const MyApp()
  ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
   return MaterialApp(
     title: 'MENU',
     theme: ThemeData(
       colorScheme: ColorScheme.fromSwatch().copyWith(
         primary: ColorsTheme.primaryColorBlue,
       ),
     ),
     initialRoute: '/menu',
     routes: {
       '/menu': (_) => const MenuScreen(),
       '/dadosCliente': (_) => const DadosCliente(),
       '/dadosComplementares': (_) => const DadosComplementares(),
       '/historicoCliente': (_) => const HistoricoClienteScreen()
     },
   );
  }
}




