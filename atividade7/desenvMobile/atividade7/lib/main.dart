import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CadastroScreen(),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contatoController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _observacaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de pet'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _contatoController,
              decoration: InputDecoration(
                labelText: 'Contato',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _cidadeController,
              decoration: InputDecoration(
                labelText: 'Cidade',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _observacaoController,
              decoration: InputDecoration(
                labelText: 'Observacao',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Lógica para processar o cadastro
                String name = _nameController.text;
                String contato = _contatoController.text;
                String telefone = _telefoneController.text;
                String cidade = _cidadeController.text;
                String obs = _observacaoController.text;
                // Aqui você pode enviar os dados para onde quiser, como uma API, por exemplo
                print('Nome: $name, Contato: $contato, Telefone: $telefone, Cidade: $cidade, Obs: $obs');
              },
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}
