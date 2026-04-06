import 'package:flutter/material.dart';

// Recebemos o nome do técnico para exibir lá no topo da tela!
class ChatInternoScreen extends StatefulWidget {
  final String nomeTecnico; 

  const ChatInternoScreen({super.key, required this.nomeTecnico});

  @override
  State<ChatInternoScreen> createState() => _ChatInternoScreenState();
}

class _ChatInternoScreenState extends State<ChatInternoScreen> {
  // Controlador para ler o que o usuário digita
  final TextEditingController _mensagemController = TextEditingController();
  
  // Lista inicial de mensagens simulando o começo da conversa
  final List<Map<String, dynamic>> _mensagens = [
    {'texto': 'Olá! Vi que você aceitou meu orçamento. Posso buscar o equipamento hoje?', 'isMe': false},
  ];

  // Função para adicionar a nova mensagem na tela
  void _enviarMensagem() {
    if (_mensagemController.text.trim().isNotEmpty) {
      setState(() {
        _mensagens.add({'texto': _mensagemController.text, 'isMe': true});
      });
      _mensagemController.clear(); // Limpa o campo de texto depois de enviar
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blueAccent),
            ),
            const SizedBox(width: 10),
            Text(widget.nomeTecnico, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
      body: Column(
        children: [
          // Área onde ficam os balões de mensagem
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _mensagens.length,
              itemBuilder: (context, index) {
                final msg = _mensagens[index];
                final isMe = msg['isMe']; // Verifica se a mensagem é minha ou do técnico
                
                return Align(
                  // Se for minha, alinha na direita. Se for dele, na esquerda.
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.blueAccent : Colors.grey[300],
                      borderRadius: BorderRadius.circular(20).copyWith(
                        bottomRight: isMe ? const Radius.circular(0) : const Radius.circular(20),
                        bottomLeft: isMe ? const Radius.circular(20) : const Radius.circular(0),
                      ),
                    ),
                    child: Text(
                      msg['texto'],
                      style: TextStyle(color: isMe ? Colors.white : Colors.black87, fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Barra inferior para digitar a mensagem
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _mensagemController,
                    decoration: InputDecoration(
                      hintText: 'Digite uma mensagem...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.blueAccent,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _enviarMensagem,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}