import 'package:flutter/material.dart';

// Pagina sobre do aplicativo com algumas informações

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        backgroundColor: Color.fromARGB(255, 225, 96, 57),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.person,
              size: 100,
              color: Color.fromARGB(255, 225, 96, 57),
            ),
            SizedBox(height: 16.0),
            Text(
              'Sobre o Aplicativo',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Este aplicativo foi desenvolvido para ajudar os usuários a gerenciar suas listas de compras de forma eficiente.',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Desenvolvedor: Igor Guilherme da Silva',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'RA: 2840482023029',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Versão: 1.0.0',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Data de lançamento: 11 de abril de 2024',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Aproveite o aplicativo e boas compras!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
