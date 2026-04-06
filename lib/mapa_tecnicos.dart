import 'package:flutter/material.dart';

class MapaTecnicos extends StatelessWidget {
  const MapaTecnicos({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista fictícia de técnicos baseada em geolocalização simulada
    final List<Map<String, dynamic>> tecnicos = [
      {'nome': 'Ana Tech', 'distancia': '1.2 km', 'avaliacao': 4.9, 'especialidade': 'Hardware & Consoles'},
      {'nome': 'Carlos Silva', 'distancia': '2.5 km', 'avaliacao': 4.8, 'especialidade': 'Formatação & Redes'},
      {'nome': 'Beto Consertos', 'distancia': '3.1 km', 'avaliacao': 4.2, 'especialidade': 'Celulares & Tablets'},
      {'nome': 'Daniela TI', 'distancia': '5.0 km', 'avaliacao': 4.5, 'especialidade': 'Recuperação de Dados'},
    ];

    return Column(
      children: [
        // METADE SUPERIOR: Mapa Simulado
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.blueGrey[100], // Cor de fundo simulando mapa
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Desenha uma grade de ruas falsa no fundo
                CustomPaint(
                  painter: _GridPainter(),
                  child: Container(),
                ),
                // Ícone representando VOCÊ (Cliente)
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.my_location, color: Colors.blueAccent, size: 36),
                    Text('Você', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueAccent)),
                  ],
                ),
                // Pinos vermelhos representando técnicos na região
                const Positioned(
                  top: 40, right: 60,
                  child: Icon(Icons.location_on, color: Colors.red, size: 36),
                ),
                const Positioned(
                  bottom: 30, left: 50,
                  child: Icon(Icons.location_on, color: Colors.red, size: 36),
                ),
                const Positioned(
                  top: 80, left: 100,
                  child: Icon(Icons.location_on, color: Colors.red, size: 28),
                ),
                // Botão de busca flutuante no mapa
                Positioned(
                  top: 16,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.search, size: 18),
                    label: const Text('Buscar nesta área'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black87,
                      elevation: 3,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),

        // METADE INFERIOR: Lista de Técnicos por Proximidade
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Técnicos próximos a você', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: tecnicos.length,
                    separatorBuilder: (context, index) => const Divider(height: 1),
                    itemBuilder: (context, index) {
                      final tec = tecnicos[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent.withOpacity(0.1),
                          child: const Icon(Icons.person, color: Colors.blueAccent),
                        ),
                        title: Text(tec['nome'], style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text('${tec['especialidade']} • a ${tec['distancia']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 18),
                            Text(' ${tec['avaliacao']}'),
                          ],
                        ),
                        onTap: () {
                          // Aqui você fará a navegação para o Perfil do Técnico (RF008)
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Uma classe utilitária rápida apenas para desenhar linhas no fundo
// Isso dá uma cara mais profissional e parecida com o Google Maps
class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 1.5;

    // Desenha linhas verticais e horizontais (grade)
    for (double i = 0; i < size.width; i += 50) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += 50) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}