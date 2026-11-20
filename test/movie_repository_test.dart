import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group("movie repository tests", () {
    TestWidgetsFlutterBinding.ensureInitialized();
    test("getMovieById returns matching movie when the id exists", () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById("movie-003");
      expect(movie, isNotNull);
      expect(movie?.title, 'The Lord of the Rings The Fellowship of the Ring');
    });
    test("getMovieById returns Null when the id does not exists", () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById("not an id");
      expect(movie, isNull);
    });
    test('loadMoviesFromAsset reads the bundled JSON movies', () async {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = await repository.loadMoviesFromAsset();
      expect(movies.length, 3);
      expect(movies[0].id, 'movie-001');
      expect(movies[1].id, 'movie-002');
      expect(movies[2].id, 'movie-003');
      expect(repository.getMovies(), movies);
    });
  });
}
