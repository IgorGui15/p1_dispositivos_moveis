import 'package:flutter/material.dart';

// Página para redefinir senha esquecida
class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esqueci minha senha'),
        backgroundColor: Color.fromARGB(255, 225, 96, 57),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    return null;
                  },
                  decoration: InputDecoration(labelText: 'E-mail'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 225, 96, 57),
                  ),
                  child: Text('Enviar'),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Funcionalidade de redefinição de senha não implementada ainda.'),
                          ),
                        );
                      } catch (e) {
                        print('Erro ao enviar e-mail de redefinição de senha: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Erro ao enviar e-mail de redefinição de senha. Verifique o endereço de e-mail.'),
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
