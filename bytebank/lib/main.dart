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
            Editor(controlador:_controladorCampoNumConta, rotulo:'Número da conta', dica:'000'),
            Editor(controlador:_controlarCampoValor, rotulo: 'Valor', dica: '0.00', icone: Icons.monetization_on),
            
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () => _criarTransferencia(_controladorCampoNumConta, _controlarCampoValor),
            )
          ],
        )
    );

  }
}

void _criarTransferencia(_controladorCampoNumConta, _controlarCampoValor){
  

  final int? numeroConta = int.tryParse(_controladorCampoNumConta.text);
  final double? valor = double.tryParse(_controlarCampoValor.text);
  debugPrint('teste');

  if(numeroConta != null && valor != null){
    final transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint('$transferenciaCriada');
  }
              
}   

class Editor extends StatelessWidget{

  final TextEditingController? controlador;
  final String? rotulo;
  final String? dica;
  final IconData? icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:  TextField(
        controller: controlador,
        style: TextStyle(
          fontSize: 24.0
        ),  //TextStyle
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null, // Se for diferente de nulo ele irá avaliar (?) e se for mentira (:) enviará uma referencia nula.
          labelText: rotulo,
          hintText: dica,
        ) 
      ),
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