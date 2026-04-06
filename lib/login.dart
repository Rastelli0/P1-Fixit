import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'home.dart';
import 'recuperar_senha.dart';

class Login extends StatefulWidget { // Mudei o nome para Login para bater com o seu main.dart
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Essa chave serve para identificar e validar o formulário
  final _formKey = GlobalKey<FormState>();
  
  // Controladores para capturar o que o usuário digita
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _entrar() {
    if (_formKey.currentState!.validate()) {
      // Leva o usuário para a Home e remove o Login da pilha
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Placeholder para o Logotipo do FixIt
                const Icon(
                  Icons.build_circle_outlined,
                  size: 100,
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 16),
                const Text(
                  'FixIt',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),

                // Campo de E-mail
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu e-mail.';
                    }
                    // Validação simples de formato de e-mail usando RegEx
                    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                      return 'Insira um e-mail válido.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Campo de Senha
                TextFormField(
                  controller: _senhaController,
                  obscureText: true, // Oculta a senha
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha.';
                    }
                    return null;
                  },
                ),
                
                // Botão Esqueceu a Senha
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                         context,
                        MaterialPageRoute(builder: (context) => const RecuperarSenhaScreen()),
                      );
                    },
                    child: const Text('Esqueceu a senha?'),
                  ),
                ),
                const SizedBox(height: 16),

                // Botão Entrar
                ElevatedButton(
                  onPressed: _entrar,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Entrar', style: TextStyle(fontSize: 18)),
                ),
                const SizedBox(height: 16),

                // Botão Cadastrar (Corrigido!)
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CadastroScreen()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Cadastrar', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}