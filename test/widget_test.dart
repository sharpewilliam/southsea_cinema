import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/movie_listing.dart';

void main() {
  group("App smoke tests", () {
    testWidgets("Movie Listings displays titles, cards and booking buttons", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MovieListing()));
      expect(find.text('The Lord of the Rings return of the king'), findsOneWidget);
      expect(find.text('The Lord of the Rings The two Towers'), findsOneWidget);
      expect(find.byType(MovieCard), findsNWidgets(2));
      final thirdMovie = find.text(
          'The Lord of the Rings The Fellowship of the Ring',
        );
      await tester.scrollUntilVisible(
          thirdMovie,
          300,
          scrollable: find.byType(Scrollable),
        );
      expect(find.text('The Lord of the Rings The Fellowship of the Ring'), findsOneWidget);
      expect(find.byType(MovieCard), findsNWidgets(3));
      expect(find.text('Book Tickets'), findsNWidgets(3));
    });
  });
}
