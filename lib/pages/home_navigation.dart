import 'package:flutter/material.dart';
import 'inicio_page.dart';
import 'dashboard_page.dart';
import 'mapa_pages.dart';
import 'historico_page.dart';
import 'editar_perfil_page.dart';
import 'configuracoes_page.dart';

class HomeNavigation extends StatefulWidget {
  const HomeNavigation({super.key});

  @override
  State<HomeNavigation> createState() => _HomeNavigationState();
}

class _HomeNavigationState extends State<HomeNavigation> {
  int _currentIndex = 2; // Começa diretamente no separador "Corrida"

 // Lista de ecrãs ligados a cada separador do menu inferior
  final List<Widget> _pages = [
    const InicioPage(),         // 0: Início
    const DashboardPage(),      // 1: Dashboard
    const MapaPage(),           // 2: Corrida (Mostra a página de corrida/mapa)
    const HistoricoPage(),      // 3: Histórico (Mostra a lista de corridas)
    const MapaPage(),           // 4: Mapa 
    const EditarPerfilPage(),   // 5: Perfil
    const ConfiguracoesPage(),  // 6: Configurações
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF131B2E),
          border: Border(top: BorderSide(color: Colors.white10)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF00E5FF),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.grid_view),
              label: 'Dashboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_run),
              label: 'Corrida',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Histórico',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Mapa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Perfil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Config.',
            ),
          ],
        ),
      ),
    );
  }
}