import 'package:flutter/material.dart';

class AppColors {
  // Paleta principal
  static const Color color1 = Color(0xFFfb6f24); // Laranja vibrante
  static const Color color2 = Color(0xFF8ca315); // Verde oliva
  static const Color color3 = Color(0xFF5191c1); // Azul claro
  static const Color color4 = Color(0xFF1e6495); // Azul médio
  static const Color color5 = Color(0xFF0a4b75); // Azul escuro

  // Cores de apoio
  static const Color backgroundColor =
      color5; // Azul escuro como fundo principal
  static const Color surfaceColor = Color(
    0xFF1a5a85,
  ); // Azul um pouco mais claro para superfícies
  static const Color cardColor = Color(0xFF2a6b96); // Azul para cards
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(
    0xFFb8d4f0,
  ); // Azul claro para texto secundário
  static const Color accentColor = color1; // Laranja como cor de destaque
  static const Color successColor = color2; // Verde para sucesso/progresso
  static const Color warningColor = Color(0xFFff9800); // Amarelo para avisos
  static const Color errorColor = Color(0xFFe53935); // Vermelho para erros

  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [color4, color5],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [color1, Color(0xFFe55a1a)],
  );

  static const LinearGradient cardGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF2a6b96), Color(0xFF1e6495)],
  );
}
