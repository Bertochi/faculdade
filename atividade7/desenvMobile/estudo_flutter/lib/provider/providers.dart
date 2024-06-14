import 'package:estudo_flutter/app/screens/dados_cliente/dados_cliente_controller.dart';
import 'package:estudo_flutter/app/screens/dados_complementares/dados_complementares_controller.dart';
import 'package:estudo_flutter/app/screens/historico_clientes/historico_cliente_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

final providers = <SingleChildWidget>[
  ChangeNotifierProvider<DadosClienteController>(
    create: (context) => DadosClienteController(),
  ),
  ChangeNotifierProvider<DadosComplementaresController>(
    create: (context) => DadosComplementaresController(),
  ),
  ChangeNotifierProvider<HistoricoClienteController>(
    create: (context) => HistoricoClienteController(),
  ),
];