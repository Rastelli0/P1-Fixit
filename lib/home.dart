import 'package:fixit/login.dart';
import 'package:flutter/material.dart';
import 'sobre.dart';
import 'novo_chamado.dart';
import 'painel_chamados.dart';
import 'mapa_tecnicos.dart';
import 'perfil_tecnico.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;

 
  final List<Widget> _telas = [
    const PainelChamados(), 
    const MapaTecnicos(),   
    const PerfilTecnico(),  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FixIt'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SobreScreen()));
            },
          ),
         IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // pushReplacement joga o usuário para o Login e "destrói" a Home 
              // para ele não conseguir voltar clicando no botão de voltar do celular
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          ),
        ],
      ),
      body: _telas[_indiceAtual],
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const NovoChamadoScreen()));
        },
        icon: const Icon(Icons.add),
        label: const Text('Novo Chamado'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice) => setState(() => _indiceAtual = indice),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Chamados'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Técnicos'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}