import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie = Movie(
  id: 'test_movie',
  title: 'The Batman',
  synopsis: 'Batman investigates crime and corruption in Gotham City.',
  ageRating: '15',
  runtime: '2h 56m',
  screeningTime: '19:30',
  ticketPrice: 10.00,
  posterImagePath: 'assets/images/the_batman.jpg',
);

const BasketItem testBasketItem = BasketItem(
  movie: testMovie,
  quantity: 2,
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

}