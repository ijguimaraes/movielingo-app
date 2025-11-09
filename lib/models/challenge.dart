class Challenge {
  final String id;
  final String movieId;
  final String audioUrl; // URL ou path do áudio
  final String correctAnswer; // A resposta correta
  final List<String> options; // 4 opções (incluindo a correta)
  final String? hint; // Dica opcional
  final int level; // Nível de dificuldade (1-3)

  Challenge({
    required this.id,
    required this.movieId,
    required this.audioUrl,
    required this.correctAnswer,
    required this.options,
    this.hint,
    required this.level,
  });
}

class ChallengeResult {
  final String challengeId;
  final String selectedAnswer;
  final bool isCorrect;
  final Duration responseTime;
  final DateTime completedAt;

  ChallengeResult({
    required this.challengeId,
    required this.selectedAnswer,
    required this.isCorrect,
    required this.responseTime,
    required this.completedAt,
  });
}
