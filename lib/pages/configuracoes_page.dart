import 'package:flutter/material.dart';

class ConfiguracoesPage extends StatelessWidget {
  const ConfiguracoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.directions_run, color: Colors.white, size: 28),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ritmo Único',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Tecnologia para corredores',
                          style: TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Títulos da Seção
              const Text(
                'PREFERÊNCIAS',
                style: TextStyle(
                  color: Color(0xFF00E5FF),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Configurações',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Ajuste as definições da sua aplicação e conta.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 24),

              // Lista de Opções de Configuração
              Expanded(
                child: ListView(
                  children: [
                    _buildSectionHeader('Conta'),
                    _buildConfigItem(Icons.person_outline, 'Editar Perfil', 'Alterar dados pessoais'),
                    _buildConfigItem(Icons.lock_outline, 'Segurança e Palavra-passe', 'Modificar credenciais de acesso'),
                    
                    const SizedBox(height: 16),
                    _buildSectionHeader('Preferências'),
                    _buildConfigSwitchItem(Icons.notifications_outlined, 'Notificações', 'Alertas de treino e metas', true),
                    _buildConfigSwitchItem(Icons.dark_mode_outlined, 'Modo Escuro', 'Tema visual ativado', true),
                    _buildConfigItem(Icons.language, 'Idioma', 'Português (PT)'),

                    const SizedBox(height: 16),
                    _buildSectionHeader('Sistema'),
                    _buildConfigItem(Icons.info_outline, 'Sobre o Ritmo Único', 'Versão 1.0.0'),
                    
                    const SizedBox(height: 20),
                    // Botão de Terminar Sessão
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        side: const BorderSide(color: Colors.redAccent),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Terminar Sessão',
                        style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold),
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF00E5FF),
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildConfigItem(IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF00E5FF)),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 14),
        onTap: () {},
      ),
    );
  }

  Widget _buildConfigSwitchItem(IconData icon, String title, String subtitle, bool value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF131B2E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white10),
      ),
      child: SwitchListTile(
        secondary: Icon(icon, color: const Color(0xFF00E5FF)),
        title: Text(title, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        value: value,
        activeColor: const Color(0xFF00E5FF),
        onChanged: (bool val) {},
      ),
    );
  }
}