import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  static const Color fundo = Color(0xFF0B0E17);
  static const Color cardCor = Color(0xFF15203F);
  static const Color ciano = Color(0xFF4FC3F7);
  static const Color textoSuave = Color(0xFF9AA3C7);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      appBar: AppBar(
        backgroundColor: fundo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Meu Perfil',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ), // <-- ESTA LINHA FALTAVA

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: [
            // Foto de Perfil e Nome
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: ciano,
                        child: Icon(Icons.person, size: 50, color: fundo),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF5B6CFF),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.edit, size: 18, color: Colors.white),
                            onPressed: () {
                              // Ação para editar perfil
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'João Vitor',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'joao.vitor@email.com',
                    style: GoogleFonts.poppins(
                      color: textoSuave,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Cards de Estatísticas do Corredor
            Row(
              children: [
                Expanded(child: _buildStatCard('Corridas', '12', Icons.directions_run)),
                const SizedBox(width: 16),
                Expanded(child: _buildStatCard('Km Totais', '48.5', Icons.map)),
              ],
            ),
            const SizedBox(height: 24),

            // Opções do Menu de Perfil
            _buildMenuItem(
              icon: Icons.person_outline,
              title: 'Editar Perfil',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.settings_outlined,
              title: 'Configurações',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.history,
              title: 'Histórico de Atividades',
              onTap: () {},
            ),
            _buildMenuItem(
              icon: Icons.help_outline,
              title: 'Ajuda e Suporte',
              onTap: () {},
            ),
            const SizedBox(height: 30),

            // Botão de Sair
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () {
                  // Voltar para a tela de onboarding ao sair
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.redAccent, width: 1.5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Terminar Sessão',
                  style: GoogleFonts.poppins(
                    color: Colors.redAccent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para os cards de estatísticas
  Widget _buildStatCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardCor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: ciano, size: 24),
          const SizedBox(height: 12),
          Text(
            value,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: textoSuave,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  // Widget auxiliar para os itens da lista
  Widget _buildMenuItem({required IconData icon, required String title, required VoidCallback onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: cardCor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: ciano),
        title: Text(
          title,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: textoSuave),
        onTap: onTap,
      ),
    );
  }
}