import 'package:flutter/material.dart';

class PerfilTecnico extends StatelessWidget {
  const PerfilTecnico({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> portfolio = [
      {'titulo': 'Limpeza de PS5', 'desc': 'Remoção de poeira e troca de pasta'},
      {'titulo': 'Cable Management', 'desc': 'Organização de cabos em PC'},
      {'titulo': 'Tela Quebrada', 'desc': 'Troca de display do iPhone 13'},
      {'titulo': 'Upgrade de RAM', 'desc': 'Instalação de memória em Note'},
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.blueAccent,
            padding: const EdgeInsets.only(top: 40, bottom: 24, left: 16, right: 16),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.person, size: 60, color: Colors.blueAccent),
                ),
                SizedBox(height: 16),
                Text('Ana Tech', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                Text('Especialista em Hardware & Consoles', style: TextStyle(fontSize: 16, color: Colors.white70)),
              ],
            ),
          ),
          
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Sobre mim', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Técnica da FATEC com 3 anos de experiência em manutenção. Foco em resolver seu problema rápido!'),
              ],
            ),
          ),

          const Divider(thickness: 1),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Portfólio: Antes e Depois', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, 
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8, 
            ),
            itemCount: portfolio.length,
            itemBuilder: (context, index) {
              final trabalho = portfolio[index];
              return Card(
                clipBehavior: Clip.antiAlias,
                elevation: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(child: Container(color: Colors.grey[400], child: const Center(child: Text('Antes', style: TextStyle(color: Colors.white))))),
                          Expanded(child: Container(color: Colors.lightBlue[200], child: const Center(child: Text('Depois', style: TextStyle(color: Colors.white))))),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(trabalho['titulo']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          Text(trabalho['desc']!, style: const TextStyle(fontSize: 12, color: Colors.grey), maxLines: 2),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}