import 'package:bytebank/models/tranferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia?> _transferencia = [];

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasStates();
  }
}

class ListaTransferenciasStates extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencia[indice];
          return ItemTransferencia(transferencia);
        },
        itemCount: widget._transferencia.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencia?> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebida) {
            //Future.delayed(Duration(seconds: 2), () {
            _atualiza(transferenciaRecebida!);
          });
          //});
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _atualiza(Transferencia transferenciaRecebida) {
    setState(() {
      // ignore: unnecessary_null_comparison
      if (transferenciaRecebida != null) {
        widget._transferencia.add(transferenciaRecebida);
      }
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia? _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia!.valor.toString()),
        subtitle: Text(_transferencia!.numConta.toString()),
      ),
    );
  }
}
