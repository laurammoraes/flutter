import 'package:flutter/material.dart';
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: FormularioTransferencia(),
          appBar: AppBar(
            title: Text('Transferências'),
          ),
          floatingActionButton: FloatingActionButton(
          onPressed: () {  },//é necessário passar o parâmetro para rodar
          child: Icon(Icons.add),
        ),
        ),
      ),
    
    );

class FormularioTransferencia extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Container(); 

  }
}
class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      children: <Widget>[
        ItemTransferencia(Transferencia(100.0, 1000)),
      ],
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
}

class ItemTransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}