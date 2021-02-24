import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final TextEditingController _usuarioController = new TextEditingController();
  final TextEditingController _senhaController = new TextEditingController();
  String _bemVindo = "";

  void _monstraBemVindo() {
    setState(() {
      if (_usuarioController.text.isNotEmpty &&
          _senhaController.text.isNotEmpty) {
        //debugPrint(_senhaController.text);
        _bemVindo = 'Bem vindo ${_usuarioController.text}';
      } else {
        _bemVindo = "Vazio / Sem usuario identificado";
      }
    });
  }

  void _cancelar() {
    _usuarioController.clear();
    _senhaController.clear();
    setState(() {
      _bemVindo = "";
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.deepOrange,
      ),
      backgroundColor: Colors.amber,
      body: Container(
        alignment: Alignment.topCenter, // Posição onde irá ficar
        child: ListView(
          //bARRA DE SCROOL
          children: [
            Image.asset("assets/v.png",
                width: 90.0, height: 90.0, color: Colors.blue),
            Container(
              width: double.infinity,
              color: Colors.white70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //Sempre tenha espaços iguais
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _usuarioController,
                      decoration: InputDecoration(
                          hintText: 'Nome',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.5)),
                          icon: Icon(Icons.person)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                          hintText: 'Senha',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.5)),
                          icon: Icon(Icons.arrow_forward_ios_rounded)),
                      obscureText: true,
                    ),
                  ),
                  Center(
                    child: Row(
                      //Fila orizontal
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      // Irá sempre fica distante mesmo mudando a orientação

                      children: [
                        Container(
                          //margin: const EdgeInsets.only(left: 50.0),
                          child: RaisedButton(
                            onPressed: _monstraBemVindo,
                            color: Colors.white,
                            child: Text(
                              "Entrar",
                              style: TextStyle(
                                  color: Colors.blueAccent, fontSize: 16.9),
                            ),
                          ),
                        ),
                        Container(
                          //margin: const EdgeInsets.only(right: 38.0),
                          child: RaisedButton(
                            onPressed: _cancelar,
                            color: Colors.white,
                            child: Text(
                              "Cancelar",
                              style: TextStyle(
                                  fontSize: 16.9, color: Colors.blueAccent),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$_bemVindo",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 19.6,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
