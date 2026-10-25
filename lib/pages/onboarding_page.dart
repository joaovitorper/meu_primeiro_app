import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cadastro_page.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static const Color fundo = Color(0xFF0B0E17);
  static const Color circuloAzul = Color(0xFF15203F);
  static const Color circuloVerde = Color(0xFF1B3242);
  static const Color ciano = Color(0xFF4FC3F7);
  static const Color textoSuave = Color(0xFF9AA3C7);

  Widget _circulo(double tamanho, Color cor) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
    );
  }

  Widget _botaoEntrar(BuildContext context) {
    return Container(
      height: 48,
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const LoginPage()),
            );
          },
          child: Center(
            child: Text(
              'Entrar',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _botaoCriarConta(BuildContext context) {
    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const SignUpPage()),
          );
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: ciano, width: 1.5),
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          'Criar conta',
          style: GoogleFonts.poppins(
            color: ciano,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: Stack(
        children: [
          Positioned(top: 80, left: -170, child: _circulo(380, circuloAzul)),
          Positioned(bottom: -140, right: -110, child: _circulo(300, circuloVerde)),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/img/final_logo.png',
                      width: 110,
                      height: 110,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 110,
                          height: 110,
                          color: Colors.grey.withValues(alpha: 0.2),
                          child: const Center(
                            child: Icon(Icons.directions_run, size: 50, color: Colors.white),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Ritmo Único',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tecnologia para corredores',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        color: ciano,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 320),
                      child: Text(
                        'Tecnologia para evoluir sem perder quem você é. '
                        'Descubra seu ritmo, acompanhe sua evolução e '
                        'alcance seus objetivos com inteligência.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: textoSuave,
                          fontSize: 13,
                          height: 1.4,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: _botaoEntrar(context)),
                        const SizedBox(width: 16),
                        Expanded(child: _botaoCriarConta(context)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}