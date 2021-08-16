import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerCampoNumConta =
      TextEditingController();
  final TextEditingController _controllerCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              controller: _controllerCampoNumConta,
              rotulo: 'Número da Conta',
              dica: '0000',
            ),
            Editor(
              controller: _controllerCampoValor,
              rotulo: 'Valor',
              dica: '0.00',
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numConta = int.tryParse(_controllerCampoNumConta.text);
    final double? valor = double.tryParse(_controllerCampoValor.text);

    if (numConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
