import 'package:flutter/material.dart';
import 'dart:async';
import '../models/movie.dart';
import '../models/challenge.dart';
import '../data/mock_challenges.dart';
import '../theme/app_colors.dart';

class ChallengeScreen extends StatefulWidget {
  final Movie movie;

  const ChallengeScreen({super.key, required this.movie});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {
  late List<Challenge> _challenges;
  int _currentChallengeIndex = 0;
  Challenge? _currentChallenge;

  // Estados do desafio
  bool _isPlayingAudio = false;
  bool _audioFinished = false;
  bool _hasAnswered = false;
  String? _selectedAnswer;
  bool? _isCorrect;

  // Cronômetro
  DateTime? _audioFinishedTime;
  DateTime? _answerTime;
  Duration? _responseTime;

  // Timer para simular reprodução de áudio
  Timer? _audioTimer;

  @override
  void initState() {
    super.initState();
    _loadChallenges();
  }

  void _loadChallenges() {
    _challenges = MockChallenges.getChallengesByMovieId(widget.movie.id);
    if (_challenges.isNotEmpty) {
      _currentChallenge = _challenges[_currentChallengeIndex];
    }
  }

  void _playAudio() {
    setState(() {
      _isPlayingAudio = true;
      _audioFinished = false;
      _hasAnswered = false;
      _selectedAnswer = null;
      _isCorrect = null;
      _audioFinishedTime = null;
      _answerTime = null;
      _responseTime = null;
    });

    // Simula reprodução de áudio por 3 segundos
    _audioTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _isPlayingAudio = false;
        _audioFinished = true;
        _audioFinishedTime = DateTime.now();
      });
    });
  }

  void _replayAudio() {
    setState(() {
      _isPlayingAudio = true;
    });

    // Simula reprodução de áudio por 3 segundos
    _audioTimer = Timer(const Duration(seconds: 3), () {
      setState(() {
        _isPlayingAudio = false;
        // Mantém _audioFinished como true
        // NÃO reinicia o cronômetro - mantém o tempo da primeira reprodução
      });
    });
  }

  void _selectAnswer(String answer) {
    if (_hasAnswered || !_audioFinished) return;

    _answerTime = DateTime.now();
    _responseTime = _answerTime!.difference(_audioFinishedTime!);

    setState(() {
      _selectedAnswer = answer;
      _isCorrect = answer == _currentChallenge?.correctAnswer;
      _hasAnswered = true;
    });
  }

  void _nextChallenge() {
    if (_currentChallengeIndex < _challenges.length - 1) {
      setState(() {
        _currentChallengeIndex++;
        _currentChallenge = _challenges[_currentChallengeIndex];
        _resetChallengeState();
      });
      // Reproduz automaticamente o próximo áudio
      _playAudio();
    } else {
      // Fim dos desafios
      _showCompletionDialog();
    }
  }

  void _resetChallengeState() {
    _isPlayingAudio = false;
    _audioFinished = false;
    _hasAnswered = false;
    _selectedAnswer = null;
    _isCorrect = null;
    _audioFinishedTime = null;
    _answerTime = null;
    _responseTime = null;
  }

  void _showCompletionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text(
          'Parabéns!',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'Você completou todos os desafios deste filme!',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
              Navigator.of(context).pop(); // Volta para a tela anterior
            },
            child: const Text(
              'Voltar',
              style: TextStyle(color: AppColors.color3),
            ),
          ),
        ],
      ),
    );
  }

  void _exitChallenge() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text(
          'Sair do Desafio',
          style: TextStyle(color: AppColors.textPrimary),
        ),
        content: const Text(
          'Tem certeza que deseja sair? Seu progresso será salvo.',
          style: TextStyle(color: AppColors.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancelar',
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Fecha o diálogo
              Navigator.of(context).pop(); // Volta para a tela anterior
            },
            child: const Text(
              'Sair',
              style: TextStyle(color: AppColors.errorColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _audioTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_currentChallenge == null) {
      return Scaffold(
        appBar: AppBar(title: Text(widget.movie.title)),
        body: const Center(
          child: Text(
            'Nenhum desafio disponível para este filme.',
            style: TextStyle(color: AppColors.textSecondary),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: _exitChallenge,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                '${_currentChallengeIndex + 1}/${_challenges.length}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Indicador de progresso
              LinearProgressIndicator(
                value: (_currentChallengeIndex + 1) / _challenges.length,
                backgroundColor: AppColors.surfaceColor,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.accentColor,
                ),
              ),
              const SizedBox(height: 24),

              // Card do desafio
              Expanded(
                child: Column(
                  children: [
                    // Área de reprodução de áudio
                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        gradient: AppColors.cardGradient,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.color5.withValues(alpha: 0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.headphones,
                            size: 64,
                            color: AppColors.accentColor,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            _isPlayingAudio
                                ? 'Reproduzindo áudio...'
                                : _audioFinished
                                ? 'Áudio concluído'
                                : 'Pressione para ouvir',
                            style: Theme.of(context).textTheme.titleLarge
                                ?.copyWith(color: AppColors.textPrimary),
                          ),
                          const SizedBox(height: 24),
                          if (!_audioFinished)
                            ElevatedButton.icon(
                              onPressed: _isPlayingAudio ? null : _playAudio,
                              icon: Icon(
                                _isPlayingAudio
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              label: Text(
                                _isPlayingAudio
                                    ? 'Reproduzindo...'
                                    : 'Reproduzir Áudio',
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 16,
                                ),
                              ),
                            ),
                          if (_isPlayingAudio)
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Botão para ouvir novamente
                    if (_audioFinished)
                      OutlinedButton.icon(
                        onPressed: _isPlayingAudio ? null : _replayAudio,
                        icon: const Icon(Icons.replay),
                        label: const Text('Ouvir Novamente'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.accentColor,
                          side: const BorderSide(color: AppColors.accentColor),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                        ),
                      ),
                    const SizedBox(height: 16),

                    // Opções de resposta
                    if (_audioFinished) ...[
                      Text(
                        'Selecione a resposta correta:',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: AppColors.textPrimary),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _currentChallenge!.options.length,
                          itemBuilder: (context, index) {
                            final option = _currentChallenge!.options[index];
                            final isSelected = _selectedAnswer == option;
                            final isCorrectOption =
                                option == _currentChallenge!.correctAnswer;

                            Color? cardColor;
                            if (_hasAnswered) {
                              if (isCorrectOption) {
                                cardColor = AppColors.successColor;
                              } else if (isSelected && !_isCorrect!) {
                                cardColor = AppColors.errorColor;
                              }
                            }

                            return Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              color: cardColor ?? AppColors.cardColor,
                              elevation: isSelected ? 8 : 2,
                              child: InkWell(
                                onTap: () => _selectAnswer(option),
                                borderRadius: BorderRadius.circular(12),
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 32,
                                        height: 32,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: cardColor != null
                                              ? Colors.white
                                              : AppColors.surfaceColor,
                                        ),
                                        child: Center(
                                          child: Text(
                                            String.fromCharCode(65 + index),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  cardColor ??
                                                  AppColors.textPrimary,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Text(
                                          option,
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: cardColor != null
                                                ? Colors.white
                                                : AppColors.textPrimary,
                                            fontWeight: isSelected
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      if (_hasAnswered && isCorrectOption)
                                        const Icon(
                                          Icons.check_circle,
                                          color: Colors.white,
                                        ),
                                      if (_hasAnswered &&
                                          isSelected &&
                                          !_isCorrect!)
                                        const Icon(
                                          Icons.cancel,
                                          color: Colors.white,
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],

                    // Feedback e botão de continuar
                    if (_hasAnswered) ...[
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: _isCorrect!
                              ? AppColors.successColor
                              : AppColors.errorColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  _isCorrect!
                                      ? Icons.check_circle
                                      : Icons.cancel,
                                  color: Colors.white,
                                  size: 32,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    _isCorrect!
                                        ? 'Correto!'
                                        : 'Incorreto. A resposta correta é: ${_currentChallenge!.correctAnswer}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Tempo de resposta: ${_responseTime!.inSeconds}s',
                              style: const TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: _nextChallenge,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: _isCorrect!
                                    ? AppColors.successColor
                                    : AppColors.errorColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                              ),
                              child: Text(
                                _currentChallengeIndex < _challenges.length - 1
                                    ? 'Continuar'
                                    : 'Finalizar',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
