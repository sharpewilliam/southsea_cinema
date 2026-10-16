import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'movie-001',
        title: 'The Lord of the Rings return of the king',
        synopsis:
            'Aragorn embraces his destiny as the rightful king while Frodo and Sam make their final push to destroy the One Ring and defeat Sauron.',
        ageRating: '12A',
        runtime: '178 minutes',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/lotr roth.jpeg',
      ),
      Movie(
        id: 'movie-002',
        title: 'The Lord of the Rings The two Towers',
        synopsis:
            'Frodo and Sam continue their perilous journey to Mordor while Aragorn, Legolas and Gimli fight to protect Middle-earth from Saruman’s growing army.',
        ageRating: '12A',
        runtime: '178 minutes',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/lotr ttt.jpeg',
      ),
      Movie(
        id: 'movie-003',
        title: 'The Lord of the Rings The Fellowship of the Ring',
        synopsis:
            'A young hobbit embarks on a perilous journey with a fellowship of companions to destroy a powerful ring and prevent the Dark Lord Sauron from conquering Middle-earth.',
        ageRating: '12A',
        runtime: '178 minutes',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/lotr fotr.jpeg',
      ),
    ];
  }
  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  }
}
