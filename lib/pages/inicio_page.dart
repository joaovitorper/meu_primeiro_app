import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  static const Color fundo = Color(0xFF0B0E17);
  static const Color ciano = Color(0xFF4FC3F7);
  static const Color textoSuave = Color(0xFF9AA3C7);
  static const Color cardFundo = Color(0xFF131B2E);

  Widget _card({required Widget child}) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: cardFundo,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: child,
    );
  }

  Widget _numero(String valor, String rotulo) {
    return Expanded(
      child: Column(
        children: [
          Text(
            valor,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            rotulo,
            style: GoogleFonts.poppins(color: textoSuave, fontSize: 11),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Saudação
              Text(
                'Olá, corredor! 👋',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Pronto para correr hoje?',
                style: GoogleFonts.poppins(color: ciano, fontSize: 13),
              ),
              const SizedBox(height: 24),

              // Botão iniciar corrida
              Container(
                height: 56,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF5B6CFF), Color(0xFF5AD0FF)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: () {
                      // Depois: abrir a aba de Corrida
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.directions_run, color: Colors.white),
                        const SizedBox(width: 8),
                        Text(
                          'Iniciar corrida',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Resumo da semana
              Text(
                'Resumo da semana',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _card(
                child: Row(
                  children: [
                    _numero('12,4 km', 'Distância'),
                    _numero('1h 12m', 'Tempo'),
                    _numero('3', 'Corridas'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Meta da semana
              _card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Meta da semana',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '12,4 / 20 km',
                          style: GoogleFonts.poppins(
                            color: ciano,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 12.4 / 20,
                        minHeight: 8,
                        backgroundColor: Colors.white.withValues(alpha: 0.08),
                        valueColor: const AlwaysStoppedAnimation(ciano),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Última corrida
              Text(
                'Última corrida',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              _card(
                child: Row(
                  children: [
                    const Icon(Icons.directions_run, color: ciano, size: 32),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Ontem, 18:30',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '5,2 km  •  Ritmo 5:45 /km',
                            style: GoogleFonts.poppins(
                              color: textoSuave,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}