import '../models/movie.dart';

class MockMovies {
  static List<Movie> getEmAndamento() {
    return [
      Movie(
        id: '1',
        title: 'The Shawshank Redemption',
        description:
            'A história de esperança, amizade e redenção na prisão de Shawshank. Perfeito para aprender vocabulário sobre justiça e humanidade.',
        imageUrl: '',
        rating: 9.3,
        genre: 'Drama',
        year: 1994,
        category: MovieCategory.emAndamento,
        progress: 0.65,
      ),
      Movie(
        id: '2',
        title: 'Inception',
        description:
            'Uma aventura mental que desafia a percepção da realidade. Ideal para aprender vocabulário científico e filosófico.',
        imageUrl: '',
        rating: 8.8,
        genre: 'Sci-Fi/Thriller',
        year: 2010,
        category: MovieCategory.emAndamento,
        progress: 0.30,
      ),
      Movie(
        id: '3',
        title: 'The Dark Knight',
        description:
            'Um épico super-herói que explora temas de justiça e moralidade. Excelente para vocabulário relacionado à psicologia e filosofia.',
        imageUrl: '',
        rating: 9.0,
        genre: 'Action/Drama',
        year: 2008,
        category: MovieCategory.emAndamento,
        progress: 0.80,
      ),
      Movie(
        id: '4',
        title: 'Interstellar',
        description:
            'Uma jornada épica através do espaço e tempo. Perfeito para aprender vocabulário científico e espacial.',
        imageUrl: '',
        rating: 8.6,
        genre: 'Sci-Fi/Drama',
        year: 2014,
        category: MovieCategory.emAndamento,
        progress: 0.45,
      ),
    ];
  }

  static List<Movie> getEmDestaque() {
    return [
      Movie(
        id: '5',
        title: 'The Godfather',
        description:
            'Um clássico do cinema que ensina sobre família, poder e tradição. Excelente para expandir vocabulário relacionado à cultura italiana.',
        imageUrl: '',
        rating: 9.2,
        genre: 'Crime/Drama',
        year: 1972,
        category: MovieCategory.emDestaque,
      ),
      Movie(
        id: '6',
        title: 'Pulp Fiction',
        description:
            'Uma obra-prima do cinema independente com diálogos memoráveis. Perfeita para aprender gírias e expressões idiomáticas.',
        imageUrl: '',
        rating: 8.9,
        genre: 'Crime/Drama',
        year: 1994,
        category: MovieCategory.emDestaque,
      ),
      Movie(
        id: '7',
        title: 'Forrest Gump',
        description:
            'A vida de um homem simples que vive momentos históricos. Excelente para aprender sobre história americana e expressões coloquiais.',
        imageUrl: '',
        rating: 8.8,
        genre: 'Drama/Romance',
        year: 1994,
        category: MovieCategory.emDestaque,
      ),
      Movie(
        id: '8',
        title: 'The Matrix',
        description:
            'Uma revolução visual que questiona a realidade. Perfeito para vocabulário tecnológico e filosófico.',
        imageUrl: '',
        rating: 8.7,
        genre: 'Action/Sci-Fi',
        year: 1999,
        category: MovieCategory.emDestaque,
      ),
      Movie(
        id: '9',
        title: 'Goodfellas',
        description:
            'Uma imersão no mundo do crime organizado. Ideal para aprender gírias e expressões do submundo.',
        imageUrl: '',
        rating: 8.7,
        genre: 'Crime/Drama',
        year: 1990,
        category: MovieCategory.emDestaque,
      ),
    ];
  }

  static List<Movie> getNovidades() {
    return [
      Movie(
        id: '10',
        title: 'Oppenheimer',
        description:
            'A história do pai da bomba atômica. Excelente para vocabulário histórico e científico.',
        imageUrl: '',
        rating: 8.5,
        genre: 'Biography/Drama',
        year: 2023,
        category: MovieCategory.novidades,
        isNew: true,
      ),
      Movie(
        id: '11',
        title: 'Spider-Man: Across the Spider-Verse',
        description:
            'Uma aventura multiversal do Homem-Aranha. Perfeito para vocabulário de super-heróis e tecnologia.',
        imageUrl: '',
        rating: 8.6,
        genre: 'Animation/Action',
        year: 2023,
        category: MovieCategory.novidades,
        isNew: true,
      ),
      Movie(
        id: '12',
        title: 'Top Gun: Maverick',
        description:
            'A volta do piloto mais famoso da Marinha. Ideal para vocabulário militar e aeronáutico.',
        imageUrl: '',
        rating: 8.3,
        genre: 'Action/Drama',
        year: 2022,
        category: MovieCategory.novidades,
        isNew: true,
      ),
      Movie(
        id: '13',
        title: 'Dune',
        description:
            'Uma saga épica de ficção científica. Excelente para vocabulário futurista e político.',
        imageUrl: '',
        rating: 8.0,
        genre: 'Sci-Fi/Adventure',
        year: 2021,
        category: MovieCategory.novidades,
        isNew: true,
      ),
      Movie(
        id: '14',
        title: 'Everything Everywhere All at Once',
        description:
            'Uma aventura multiversal surreal. Perfeito para vocabulário filosófico e criativo.',
        imageUrl: '',
        rating: 8.1,
        genre: 'Action/Comedy',
        year: 2022,
        category: MovieCategory.novidades,
        isNew: true,
      ),
    ];
  }

  static List<Movie> getRecomendados() {
    return [
      Movie(
        id: '15',
        title: 'The Social Network',
        description:
            'A criação do Facebook e o mundo da tecnologia. Ideal para vocabulário empresarial e tecnológico.',
        imageUrl: '',
        rating: 7.7,
        genre: 'Biography/Drama',
        year: 2010,
        category: MovieCategory.recomendados,
        isRecommended: true,
      ),
      Movie(
        id: '16',
        title: 'La La Land',
        description:
            'Um musical moderno sobre sonhos e amor. Excelente para vocabulário artístico e emocional.',
        imageUrl: '',
        rating: 8.0,
        genre: 'Musical/Romance',
        year: 2016,
        category: MovieCategory.recomendados,
        isRecommended: true,
      ),
      Movie(
        id: '17',
        title: 'Whiplash',
        description:
            'A obsessão pela perfeição na música. Perfeito para vocabulário musical e psicológico.',
        imageUrl: '',
        rating: 8.5,
        genre: 'Drama/Music',
        year: 2014,
        category: MovieCategory.recomendados,
        isRecommended: true,
      ),
      Movie(
        id: '18',
        title: 'Her',
        description:
            'Um romance futurista com inteligência artificial. Ideal para vocabulário tecnológico e emocional.',
        imageUrl: '',
        rating: 8.0,
        genre: 'Sci-Fi/Romance',
        year: 2013,
        category: MovieCategory.recomendados,
        isRecommended: true,
      ),
      Movie(
        id: '19',
        title: 'Moonlight',
        description:
            'Uma jornada de autodescoberta e identidade. Excelente para vocabulário social e emocional.',
        imageUrl: '',
        rating: 7.4,
        genre: 'Drama',
        year: 2016,
        category: MovieCategory.recomendados,
        isRecommended: true,
      ),
    ];
  }

  static List<Movie> getAllMovies() {
    return [
      ...getEmAndamento(),
      ...getEmDestaque(),
      ...getNovidades(),
      ...getRecomendados(),
    ];
  }
}
