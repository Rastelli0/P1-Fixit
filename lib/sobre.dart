import 'package:flutter/material.dart';

class SobreScreen extends StatelessWidget {
  const SobreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre o FixIt')),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('FixIt – Manutenção de TI por demanda', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Versão: 1.0.0'),
            SizedBox(height: 20),
            Text('Objetivo:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Conectar usuários a técnicos de TI locais para suporte em hardware e software.'),
            SizedBox(height: 20),
            Text('Equipe:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Guilherme Rastelli\nJoao Gabriel'),
            SizedBox(height: 20),
            Text('Disciplina: Desenvolvimento de Dispositivos Móveis'),
            Text('Instituição: FATEC'),
          ],
        ),
      ),
    );
  }
}