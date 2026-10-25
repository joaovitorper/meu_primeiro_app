import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CorridaPage extends StatelessWidget {
  const CorridaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0E17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF131827),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Nova Corrida',
          style: GoogleFonts.poppins(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.directions_run, size: 64, color: Color(0xFF4FC3F7)),
            const SizedBox(height: 16),
            Text(
              'Pronto para correr?',
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Toque no botão abaixo para iniciar o rastreio.',
              style: GoogleFonts.poppins(color: const Color(0xFF9AA3C7), fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}