import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/views/basket_view.dart';

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

  testWidgets('BasketView displays empty message when basket has no items', (
    WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: BasketView()));

    expect(find.text('Your basket is empty'), findsOneWidget);
    expect(find.text('Checkout'), findsNothing);
  });

  testWidgets(
    'BasketView renders items and removes item when delete pressed',
    (WidgetTester tester) async {
      BasketRepository.instance.addItem(testBasketItem);

      await tester.pumpWidget(const MaterialApp(home: BasketView()));

      expect(find.text('Your Basket'), findsOneWidget);
      expect(find.text('2 x 10.0'), findsOneWidget);
      expect(find.text('£20.00'), findsWidgets);
      expect(find.text('Checkout'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pump();

      expect(find.text('Your basket is empty'), findsOneWidget);
    },
  );
}
