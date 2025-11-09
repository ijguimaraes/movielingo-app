import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../data/mock_movies.dart';
import '../widgets/movie_section.dart';
import '../theme/app_colors.dart';
import 'challenge_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieLingo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar busca
            },
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // TODO: Implementar perfil
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Header com saudação
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(20),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bem-vindo de volta!',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Continue aprendendo com estes filmes',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Seção: Em Andamento
          SliverToBoxAdapter(
            child: MovieSection(
              title: 'Em Andamento',
              movies: MockMovies.getEmAndamento(),
              onMovieTap: (movie) => _showMovieDetails(context, movie),
            ),
          ),

          // Seção: Em Destaque
          SliverToBoxAdapter(
            child: MovieSection(
              title: 'Em Destaque',
              movies: MockMovies.getEmDestaque(),
              onMovieTap: (movie) => _showMovieDetails(context, movie),
            ),
          ),

          // Seção: Novidades
          SliverToBoxAdapter(
            child: MovieSection(
              title: 'Novidades',
              movies: MockMovies.getNovidades(),
              onMovieTap: (movie) => _showMovieDetails(context, movie),
            ),
          ),

          // Seção: Recomendados
          SliverToBoxAdapter(
            child: MovieSection(
              title: 'Recomendados',
              movies: MockMovies.getRecomendados(),
              onMovieTap: (movie) => _showMovieDetails(context, movie),
            ),
          ),

          // Espaço extra no final
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  void _showMovieDetails(BuildContext context, Movie movie) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              movie.title,
              style: const TextStyle(color: AppColors.textPrimary),
            ),
            if (movie.progress != null) ...[
              const SizedBox(height: 8),
              Text(
                'Progresso: ${(movie.progress! * 100).toInt()}%',
                style: TextStyle(color: AppColors.successColor, fontSize: 14),
              ),
              const SizedBox(height: 4),
              LinearProgressIndicator(
                value: movie.progress,
                backgroundColor: AppColors.surfaceColor,
                valueColor: const AlwaysStoppedAnimation<Color>(
                  AppColors.successColor,
                ),
              ),
            ],
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ano: ${movie.year}',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            Text(
              'Gênero: ${movie.genre}',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            Text(
              'Avaliação: ${movie.rating}/10',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            Text(
              'Categoria: ${_getCategoryName(movie.category)}',
              style: const TextStyle(color: AppColors.textSecondary),
            ),
            const SizedBox(height: 16),
            Text(
              movie.description,
              style: const TextStyle(color: AppColors.textPrimary),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Fechar',
              style: TextStyle(color: AppColors.color3),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _startLearning(context, movie);
            },
            child: Text(
              movie.progress != null
                  ? 'Continuar Aprendizado'
                  : 'Começar Aprendizado',
            ),
          ),
        ],
      ),
    );
  }

  String _getCategoryName(MovieCategory category) {
    switch (category) {
      case MovieCategory.emAndamento:
        return 'Em Andamento';
      case MovieCategory.emDestaque:
        return 'Em Destaque';
      case MovieCategory.novidades:
        return 'Novidades';
      case MovieCategory.recomendados:
        return 'Recomendados';
    }
  }

  void _startLearning(BuildContext context, Movie movie) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => ChallengeScreen(movie: movie)),
    );
  }
}
