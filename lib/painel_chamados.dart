import 'package:flutter/material.dart';
import 'chat_interno.dart';

class PainelChamados extends StatelessWidget {
  const PainelChamados({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista fictícia de orçamentos para simular o banco de dados
    final List<Map<String, dynamic>> lances = [
      {'nome': 'Carlos Silva', 'avaliacao': 4.8, 'preco': 150.00, 'mensagem': 'Posso buscar hoje à tarde e entrego amanhã.'},
      {'nome': 'Ana Tech', 'avaliacao': 4.9, 'preco': 180.00, 'mensagem': 'Limpeza completa no PS5 com troca de pasta térmica.'},
      {'nome': 'João Consertos', 'avaliacao': 4.5, 'preco': 120.00, 'mensagem': 'Faço amanhã de manhã, tenho a peça aqui.'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Cabeçalho mostrando qual é o Chamado Ativo do cliente
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.blueAccent.withOpacity(0.1),
          width: double.infinity,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Seu chamado ativo', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Limpeza de PS5 esquentando muito', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Aberto há 2 horas • 3 orçamentos recebidos'),
            ],
          ),
        ),
        
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text('Orçamentos Recebidos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),

        // Lista de Lances gerada dinamicamente
        Expanded(
          child: ListView.builder(
            itemCount: lances.length, // Diz quantos itens a lista tem
            itemBuilder: (context, index) {
              final lance = lances[index]; // Pega o lance específico daquela posição
              
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(lance['nome'], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text(
                            'R\$ ${lance['preco'].toStringAsFixed(2)}', 
                            style: const TextStyle(fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          Text(' ${lance['avaliacao']}'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(lance['mensagem'], style: TextStyle(color: Colors.grey[700])),
                      const SizedBox(height: 16),
                      
                      // Botão de Aceitar Lance
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  // Passamos o nome do técnico específico que o usuário escolheu
                                  builder: (context) => ChatInternoScreen(nomeTecnico: lance['nome']),
                                ),
                              );
                            },
                          child: const Text('Aceitar Orçamento'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}