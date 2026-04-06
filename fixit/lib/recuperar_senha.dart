import 'package:flutter/material.dart';

class RecuperarSenhaScreen extends StatefulWidget {
  const RecuperarSenhaScreen({super.key});

  @override
  State<RecuperarSenhaScreen> createState() => _RecuperarSenhaScreenState();
}

class _RecuperarSenhaScreenState extends State<RecuperarSenhaScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  void _enviarInstrucoes() {
    if (_formKey.currentState!.validate()) {
      // Exibe a mensagem de confirmação
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Instruções de recuperação enviadas para o seu e-mail!'),
          backgroundColor: Colors.green,
        ),
      );
      // Volta para a tela de Login automaticamente após "enviar"
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar Senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.lock_reset, size: 80, color: Colors.blueAccent),
              const SizedBox(height: 24),
              const Text(
                'Esqueceu sua senha?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Digite seu e-mail abaixo. Enviaremos um link para você redefinir sua senha.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 32),

              // Campo de E-mail
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail cadastrado',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail.';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Insira um e-mail válido.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Botão Enviar
              ElevatedButton(
                onPressed: _enviarInstrucoes,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Enviar Instruções', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}