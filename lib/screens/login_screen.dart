import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import '../theme/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo/Title
                Icon(Icons.movie, size: 80, color: AppColors.accentColor),
                const SizedBox(height: 16),
                Text(
                  'MovieLingo',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Aprenda idiomas assistindo filmes',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),

                // Login buttons
                _buildLoginButton(
                  context,
                  'Continuar com Google',
                  Icons.g_mobiledata,
                  AppColors.color1,
                  () => _mockLogin(context, 'Google'),
                ),
                const SizedBox(height: 16),
                _buildLoginButton(
                  context,
                  'Continuar com Facebook',
                  Icons.facebook,
                  AppColors.color3,
                  () => _mockLogin(context, 'Facebook'),
                ),
                const SizedBox(height: 16),
                _buildLoginButton(
                  context,
                  'Continuar com Apple',
                  CupertinoIcons.device_phone_portrait,
                  AppColors.color5,
                  () => _mockLogin(context, 'Apple'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
    BuildContext context,
    String text,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: AppColors.textPrimary),
        label: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          shadowColor: color.withValues(alpha: 0.3),
        ),
      ),
    );
  }

  void _mockLogin(BuildContext context, String provider) async {
    // Verificar se o widget ainda está montado
    if (!context.mounted) return;

    // Simular loading
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(color: AppColors.accentColor),
              const SizedBox(height: 16),
              Text(
                'Entrando com $provider...',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    // Simular delay de login
    await Future.delayed(const Duration(seconds: 2));

    // Verificar novamente se o widget ainda está montado
    if (!context.mounted) return;

    // Fechar loading e navegar para home
    Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }
}
