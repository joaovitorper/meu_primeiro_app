import 'package:flutter/material.dart';

class EditarPerfilPage extends StatelessWidget {
  const EditarPerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E1A),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Cabeçalho
              const Row(
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
              const SizedBox(height: 30),

              // Título da Seção
              const Text(
                'MEU PERFIL',
                style: TextStyle(
                  color: Color(0xFF00E5FF),
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Editar Perfil',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'Atualize as suas informações pessoais e preferências.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 30),

              // Foto de Perfil com ícone de edição
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(0xFF131B2E),
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF00E5FF), width: 2),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF00E5FF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      color: Color(0xFF0A0E1A),
                      size: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Campos de Texto estilizados
              _buildTextField('Nome Completo', 'Digite o seu nome', Icons.person_outline),
              const SizedBox(height: 16),
              _buildTextField('Email', 'Digite o seu email', Icons.email_outlined),
              const SizedBox(height: 16),
              _buildTextField('Peso (kg)', 'Ex: 70 kg', Icons.monitor_weight_outlined),
              const SizedBox(height: 16),
              _buildTextField('Altura (m)', 'Ex: 1.75 m', Icons.height),
              const SizedBox(height: 30),

              // Botão de Guardar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Ação ao salvar alterações
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                  ),
                  child: Ink(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF5B67CA), Color(0xFF00E5FF)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(minHeight: 48),
                      child: const Text(
                        'Guardar Alterações',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, IconData icon) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey.withValues(alpha: 0.5), fontSize: 14),
            prefixIcon: Icon(icon, color: const Color(0xFF00E5FF), size: 20),
            filled: true,
            fillColor: const Color(0xFF131B2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF00E5FF)),
            ),
          ),
        ),
      ],
    );
  }
}