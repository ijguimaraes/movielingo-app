enum MovieCategory { emAndamento, emDestaque, novidades, recomendados }

class Movie {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double rating;
  final String genre;
  final int year;
  final MovieCategory category;
  final double? progress; // Para filmes em andamento (0.0 a 1.0)
  final bool isNew; // Para seção de novidades
  final bool isRecommended; // Para seção de recomendados

  Movie({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.genre,
    required this.year,
    required this.category,
    this.progress,
    this.isNew = false,
    this.isRecommended = false,
  });
}
