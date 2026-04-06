import 'package:flutter/material.dart';

class NovoChamadoScreen extends StatelessWidget {
  const NovoChamadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publicar Chamado')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'O que precisa de conserto?', hintText: 'Ex: PC não liga, Limpeza de PS5'),
            ),
            const SizedBox(height: 20),
            const TextField(
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Descrição detalhada', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {}, // Futura lógica de anexo de fotos
              icon: const Icon(Icons.camera_alt),
              label: const Text('Anexar Fotos'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Publicar Chamado'),
              ),
            )
          ],
        ),
      ),
    );
  }
}