import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dashboard_page.dart';
import 'recuperar_senha_page.dart';
import 'cadastro_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Cores padrão do projeto
  static const Color fundo = Color(0xFF0B0E17);
  static const Color circuloAzul = Color(0xFF15203F);
  static const Color circuloVerde = Color(0xFF1B3242);
  static const Color ciano = Color(0xFF4FC3F7);
  static const Color textoSuave = Color(0xFF9AA3C7);
  static const Color cardFundo = Color(0xFF131B2E);

  // Controladores para o login
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _senhaVisivel = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  Widget _circulo(double tamanho, Color cor) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(color: cor, shape: BoxShape.circle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: fundo,
      body: Stack(
        children: [
          // Bolhas decorativas de fundo
          Positioned(top: -100, right: -120, child: _circulo(350, circuloAzul)),
          Positioned(bottom: -140, left: -110, child: _circulo(300, circuloVerde)),
          
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Logótipo e Subtítulo do topo
                      Text(
                        'Ritmo Único',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Tecnologia para corredores',
                        style: GoogleFonts.poppins(
                          color: textoSuave,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Cartão principal de login
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: cardFundo,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.05),
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Título dentro do cartão
                              Text(
                                'Entrar na conta',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Insira os seus dados para aceder ao painel.',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  color: textoSuave,
                                  fontSize: 12,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Campo E-mail
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: GoogleFonts.poppins(color: textoSuave, fontSize: 12),
                                  filled: true,
                                  fillColor: const Color(0xFF0B0E17),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: ciano, width: 1.5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty || !value.contains('@')) {
                                    return 'Insira um e-mail válido';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 16),

                              // Campo Senha com o "olhinho"
                              TextFormField(
                                controller: _senhaController,
                                obscureText: !_senhaVisivel,
                                style: GoogleFonts.poppins(color: Colors.white, fontSize: 13),
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  labelStyle: GoogleFonts.poppins(color: textoSuave, fontSize: 12),
                                  filled: true,
                                  fillColor: const Color(0xFF0B0E17),
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                                      color: textoSuave,
                                      size: 18,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _senhaVisivel = !_senhaVisivel;
                                      });
                                    },
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.08)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(color: ciano, width: 1.5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length < 6) {
                                    return 'Insira uma senha válida (mín. 6 caracteres)';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),

                              // Link "Esqueceu a senha?"
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const RecuperarSenhaPage()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    minimumSize: const Size(50, 30),
                                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                  child: Text(
                                    'Esqueceu a senha?',
                                    style: GoogleFonts.poppins(color: ciano, fontSize: 11),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Botão Entrar com Gradiente
                              Container(
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
                                      if (_formKey.currentState!.validate()) {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(builder: (_) => const DashboardPage()),
                                        );
                                      }
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
                              ),
                              const SizedBox(height: 20),

                              // Divisor 'ou'
                              Row(
                                children: [
                                  Expanded(child: Divider(color: textoSuave.withValues(alpha: 0.3))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    child: Text(
                                      'ou',
                                      style: GoogleFonts.poppins(color: textoSuave, fontSize: 12),
                                    ),
                                  ),
                                  Expanded(child: Divider(color: textoSuave.withValues(alpha: 0.3))),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Link 'Não tem uma conta? Cadastre-se'
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Não tem uma conta? ',
                                    style: GoogleFonts.poppins(color: textoSuave, fontSize: 12),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (_) => const SignUpPage()),
                                      );
                                    },
                                    child: Text(
                                      'Cadastre-se',
                                      style: GoogleFonts.poppins(
                                        color: ciano,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Botão inferior de voltar ao início
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Text(
                          '← Voltar para o início',
                          style: GoogleFonts.poppins(
                            color: textoSuave,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}