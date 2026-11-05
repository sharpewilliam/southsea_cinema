import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
  id: 'test movie 1',
  title: 'Test Movie',
  synopsis: 'A movie for testing purposes.',
  posterImagePath: 'assets/images/lotr roth.jpeg',
  ageRating: '12A',
  runtime: '120 minutes',
  screeningTime: '19:30',
  ticketPrice: 10.00,
);

const Movie testMovie2 = Movie(
  id: 'test movie 2',
  title: 'Test Movie 2',
  synopsis: 'Another movie for testing purposes.',
  posterImagePath: 'assets/images/lotr ttt.jpeg',
  ageRating: '12A',
  runtime: '130 minutes',
  screeningTime: '20:00',
  ticketPrice: 12.00,
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });
}