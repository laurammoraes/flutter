import 'package:flutter/material.dart';
void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
        home: Scaffold(
          body: FormularioTransferencia(),
        ),
    );

  }
  
}

class FormularioTransferencia extends StatelessWidget{

  final TextEditingController _controladorCampoNumConta = TextEditingController();
  final TextEditingController _controlarCampoValor = TextEditingController();

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Criando transferência')),
        body:Column(
          children:<Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                controller: _controladorCampoNumConta,
                style: TextStyle(
                  fontSize: 24.0
                ),  //TextStyle
                decoration: InputDecoration(
                  labelText: 'Número da conta',
                  hintText: '000',
                ) 
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:  TextField(
                controller: _controlarCampoValor,
                style: TextStyle(
                 
                  fontSize: 24.0
                ),  //TextStyle
                decoration: InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '000',
                ) 
              ),
            ),
           
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () {
               

                final int? numeroConta = int.tryParse(_controladorCampoNumConta.text);
                final double? valor = double.tryParse(_controlarCampoValor.text);
                

                if(numeroConta != null && valor != null){
                  final transferenciaCriada = Transferencia(valor, numeroConta);
                  debugPrint('$transferenciaCriada');
                }
              },
            )
          ],
        )
    );

  }
}
class ListaTransferencias extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 3000)),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {  },
        child: Icon(Icons.add),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);
  @override
  String toString(){
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }

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