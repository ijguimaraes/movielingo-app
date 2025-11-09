import '../models/challenge.dart';

class MockChallenges {
  // Desafios para "The Shawshank Redemption"
  static List<Challenge> getShawshankChallenges() {
    return [
      Challenge(
        id: 'c1',
        movieId: '1',
        audioUrl: 'assets/audio/shawshank_1.mp3',
        correctAnswer: 'Hope',
        options: ['Hope', 'Freedom', 'Justice', 'Redemption'],
        hint: 'O tema central do filme',
        level: 1,
      ),
      Challenge(
        id: 'c2',
        movieId: '1',
        audioUrl: 'assets/audio/shawshank_2.mp3',
        correctAnswer: 'Prison',
        options: ['Prison', 'School', 'Hospital', 'Court'],
        level: 1,
      ),
      Challenge(
        id: 'c3',
        movieId: '1',
        audioUrl: 'assets/audio/shawshank_3.mp3',
        correctAnswer: 'Friend',
        options: ['Enemy', 'Friend', 'Guard', 'Lawyer'],
        level: 2,
      ),
    ];
  }

  // Desafios para "Inception"
  static List<Challenge> getInceptionChallenges() {
    return [
      Challenge(
        id: 'c4',
        movieId: '2',
        audioUrl: 'assets/audio/inception_1.mp3',
        correctAnswer: 'Dream',
        options: ['Dream', 'Reality', 'Memory', 'Illusion'],
        hint: 'O conceito principal do filme',
        level: 1,
      ),
      Challenge(
        id: 'c5',
        movieId: '2',
        audioUrl: 'assets/audio/inception_2.mp3',
        correctAnswer: 'Time',
        options: ['Time', 'Space', 'Mind', 'Sleep'],
        level: 2,
      ),
      Challenge(
        id: 'c6',
        movieId: '2',
        audioUrl: 'assets/audio/inception_3.mp3',
        correctAnswer: 'Architect',
        options: ['Architect', 'Engineer', 'Designer', 'Builder'],
        level: 3,
      ),
    ];
  }

  // Desafios para "The Dark Knight"
  static List<Challenge> getDarkKnightChallenges() {
    return [
      Challenge(
        id: 'c7',
        movieId: '3',
        audioUrl: 'assets/audio/darkknight_1.mp3',
        correctAnswer: 'Hero',
        options: ['Hero', 'Villain', 'Leader', 'Fighter'],
        level: 1,
      ),
      Challenge(
        id: 'c8',
        movieId: '3',
        audioUrl: 'assets/audio/darkknight_2.mp3',
        correctAnswer: 'Chaos',
        options: ['Order', 'Chaos', 'Peace', 'War'],
        level: 2,
      ),
      Challenge(
        id: 'c9',
        movieId: '3',
        audioUrl: 'assets/audio/darkknight_3.mp3',
        correctAnswer: 'Justice',
        options: ['Justice', 'Revenge', 'Power', 'Control'],
        level: 2,
      ),
    ];
  }

  // Desafios para "Interstellar"
  static List<Challenge> getInterstellarChallenges() {
    return [
      Challenge(
        id: 'c10',
        movieId: '4',
        audioUrl: 'assets/audio/interstellar_1.mp3',
        correctAnswer: 'Space',
        options: ['Space', 'Earth', 'Ocean', 'Sky'],
        level: 1,
      ),
      Challenge(
        id: 'c11',
        movieId: '4',
        audioUrl: 'assets/audio/interstellar_2.mp3',
        correctAnswer: 'Gravity',
        options: ['Gravity', 'Light', 'Sound', 'Energy'],
        level: 2,
      ),
      Challenge(
        id: 'c12',
        movieId: '4',
        audioUrl: 'assets/audio/interstellar_3.mp3',
        correctAnswer: 'Survival',
        options: ['Survival', 'Adventure', 'Discovery', 'Exploration'],
        level: 3,
      ),
    ];
  }

  // Função para obter desafios por ID do filme
  static List<Challenge> getChallengesByMovieId(String movieId) {
    switch (movieId) {
      case '1':
        return getShawshankChallenges();
      case '2':
        return getInceptionChallenges();
      case '3':
        return getDarkKnightChallenges();
      case '4':
        return getInterstellarChallenges();
      default:
        // Para outros filmes, retorna desafios genéricos
        return _getGenericChallenges(movieId);
    }
  }

  static List<Challenge> _getGenericChallenges(String movieId) {
    return [
      Challenge(
        id: 'generic_1_$movieId',
        movieId: movieId,
        audioUrl: 'assets/audio/generic_1.mp3',
        correctAnswer: 'Hello',
        options: ['Hello', 'Goodbye', 'Thanks', 'Please'],
        level: 1,
      ),
      Challenge(
        id: 'generic_2_$movieId',
        movieId: movieId,
        audioUrl: 'assets/audio/generic_2.mp3',
        correctAnswer: 'Thank you',
        options: ['Thank you', 'Sorry', 'Excuse me', 'Welcome'],
        level: 1,
      ),
      Challenge(
        id: 'generic_3_$movieId',
        movieId: movieId,
        audioUrl: 'assets/audio/generic_3.mp3',
        correctAnswer: 'Movie',
        options: ['Movie', 'Book', 'Show', 'Series'],
        level: 2,
      ),
    ];
  }
}
