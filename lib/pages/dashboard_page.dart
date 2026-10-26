import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meu_primeiro_app/pages/configuracoes_page.dart';
import 'package:meu_primeiro_app/pages/corrida_page.dart';
import 'package:meu_primeiro_app/pages/historico_page.dart';
import 'package:meu_primeiro_app/pages/mapa_pages.dart';
import 'perfil_page.dart';
import 'inicio_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0; // Começa na aba Início

  static const Color fundo = Color(0xFF0B0E17);
  static const Color cardFundo = Color(0xFF131827);
  static const Color ciano = Color(0xFF4FC3F7);
  static const Color textoSuave = Color(0xFF9AA3C7);

  // Widget para o corpo principal do Dashboard
  Widget _buildDashboardBody(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logótipo e subtítulo no topo
          Image.asset(
            'assets/img/final_logo.png',
            width: 70,
            height: 70,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: cardFundo,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Center(
                  child: Icon(Icons.directions_run, size: 36, color: Colors.white),
                ),
              );
            },
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ciano.withValues(alpha: 0.3)),
            ),
            child: Text(
              'Tecnologia para corredores',
              style: GoogleFonts.poppins(
                color: ciano,
                fontSize: 10,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Card de Boas-Vindas (Seu Dashboard)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardFundo,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SEU DASHBOARD',
                  style: GoogleFonts.poppins(
                    color: ciano,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Olá, João Vitor!',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Acompanhe seu desempenho e continue evoluindo no seu ritmo.',
                  style: GoogleFonts.poppins(
                    color: textoSuave,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Grelha de 4 Métricas (Distância, Tempo, Calorias, Objetivo)
          Row(
            children: [
              Expanded(child: _buildMetricCard('DISTÂNCIA', '0 km', 'Nesta semana')),
              const SizedBox(width: 12),
              Expanded(child: _buildMetricCard('TEMPO', '0h 00min', 'Tempo corrido')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _buildMetricCard('CALORIAS', '0', 'Calorias gastas')),
              const SizedBox(width: 12),
              Expanded(child: _buildMetricCard('OBJETIVO', '0%', 'Meta semanal')),
            ],
          ),
          const SizedBox(height: 16),

          // Card de Desempenho e Sua Evolução
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: cardFundo,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DESEMPENHO',
                  style: GoogleFonts.poppins(
                    color: ciano,
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Sua evolução',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Comece sua primeira corrida para acompanhar sua evolução.',
                  style: GoogleFonts.poppins(
                    color: textoSuave,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 20),
                // Barra de Progresso
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: 0.0,
                    backgroundColor: const Color(0xFF1A2238),
                    valueColor: const AlwaysStoppedAnimation<Color>(ciano),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Progresso semanal',
                      style: GoogleFonts.poppins(
                        color: textoSuave,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      '0%',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Botões de Ação Principal (Iniciar Corrida e Ver Histórico)
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  height: 48,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF5B6CFF), Color(0xFF5AD0FF)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Ação para iniciar corrida
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.directions_run, color: Colors.white, size: 18),
                        const SizedBox(width: 8),
                        Text(
                          'Iniciar corrida',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 4,
                child: SizedBox(
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () {
                      // Ação para ver histórico
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white.withValues(alpha: 0.1), width: 1.5),
                      backgroundColor: cardFundo,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.bar_chart, color: Colors.white, size: 16),
                        const SizedBox(width: 6),
                        Text(
                          'Ver histórico',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Placeholder para as outras abas enquanto não cria as respetivas páginas
  Widget _buildPlaceholder(String title) {
    return Center(
      child: Text(
        title,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Lista de telas associadas a cada aba do BottomNavigationBar
    final List<Widget> telas = [
      const InicioPage(),                   // Índice 0 (Início)
      _buildDashboardBody(context),         // Índice 1 (Dashboard)
      const CorridaPage(),         // Índice 2
      const HistoricoPage(),       // Índice 3
      const MapaPage(),            // Índice 4
      const PerfilPage(),                   // Índice 5 (Perfil)
      const ConfiguracoesPage(),   // Índice 6
    ];

    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: telas[_currentIndex],
      ),
      // Barra de Navegação Inferior
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: cardFundo,
          border: Border(
            top: BorderSide(color: Colors.white.withValues(alpha: 0.05), width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: ciano,
          unselectedItemColor: textoSuave,
          selectedLabelStyle: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w600),
          unselectedLabelStyle: GoogleFonts.poppins(fontSize: 10, fontWeight: FontWeight.w500),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.directions_run), label: 'Corrida'),
            BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Histórico'),
            BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Mapa'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Perfil'),
            BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: 'Configurações'),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para os cartões de métricas
  Widget _buildMetricCard(String title, String value, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardFundo,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              color: ciano,
              fontSize: 9,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: GoogleFonts.poppins(
              color: textoSuave,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}