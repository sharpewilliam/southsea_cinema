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

  group('BasketRepository tests', (){
    test('starts with an empty basket and zero totals', () {
      final BasketRepository basket = BasketRepository.instance;
      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.totalItemCount, 0);
      expect(basket.getSubtotal(), 0);
      expect(basket.getTotal(), 0.0);
    });

    test('adds items and calculates totals correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item1 = BasketItem(
        movie: testMovie1,
        quantity: 2,
      );

      const BasketItem item2 = BasketItem(
        movie: testMovie2,
        quantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getItems().length, 2);
      expect(basket.getTotalItems(), 3);
      expect(basket.totalItemCount, 3);
      expect(basket.getSubtotal(), 32.0);
      expect(basket.getTotal(), 32.0);
    });

    test('removes items correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item = BasketItem(
        movie: testMovie1,
        quantity: 1,
      );

      basket.addItem(item);
      expect(basket.getItems().length, 1);
      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.totalItemCount, 0);
      expect(basket.getSubtotal(), 0);
      expect(basket.getTotal(), 0.0);
    });

    test('clears all items correctly', () {
      final BasketRepository basket = BasketRepository.instance;
      const BasketItem item1 = BasketItem(
        movie: testMovie1,
        quantity: 2,
      );

      const BasketItem item2 = BasketItem(
        movie: testMovie2,
        quantity: 1,
      );

      basket.addItem(item1);
      basket.addItem(item2);
      expect(basket.getItems().length, 2);
      basket.clear();

      expect(basket.getItems().length, 0);
      expect(basket.getTotalItems(), 0);
      expect(basket.totalItemCount, 0);
      expect(basket.getSubtotal(), 0.0);
      expect(basket.getTotal(), 0.0);
    });
  });
}