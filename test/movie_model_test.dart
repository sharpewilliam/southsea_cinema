import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group("Movie model tests:", () {
    test("creates movie instance with the given properties", () {
      const movie = Movie(
        id: 'movie-001',
        title: 'The Lord of the Rings return of the king',
        synopsis:
            'Aragorn embraces his destiny as the rightful king while Frodo and Sam make their final push to destroy the One Ring and defeat Sauron.',
        ageRating: '12A',
        runtime: '178 minutes',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/lotr roth.jpeg',
      );
      expect(movie.id, 'movie-001');
      expect(movie.title, 'The Lord of the Rings return of the king');
      expect(
        movie.synopsis,
        'Aragorn embraces his destiny as the rightful king while Frodo and Sam make their final push to destroy the One Ring and defeat Sauron.',
      );
      expect(movie.ageRating, '12A');
      expect(movie.runtime, '178 minutes');
      expect(movie.screeningTime, '19:30');
      expect(movie.ticketPrice, 12.50);
      expect(movie.posterImagePath, 'assets/images/lotr roth.jpeg');
    });
    test("formattedPrice displays a whole-pound price with two decimals", () {
      const movie = Movie(
        id: 'movie-002',
        title: 'The Lord of the Rings The two Towers',
        synopsis:
            'Frodo and Sam continue their perilous journey to Mordor while Aragorn, Legolas and Gimli fight to protect Middle-earth from Saruman’s growing army.',
        ageRating: '12A',
        runtime: '178 minutes',
        screeningTime: '19:30',
        ticketPrice: 12.50,
        posterImagePath: 'assets/images/lotr ttt.jpeg',
      );
      expect(movie.formattedPrice, '£12.50');
    });
  });
}
