import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cinemaSurface,
      child: Padding(
        padding: EdgeInsets.all(cinemaPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  movie.posterImagePath,
                  width: 100,
                  height: 150,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title, style: cinemaHeaderStyle),
                      Text('Age rating: ${movie.ageRating}'),
                      Text('Screening: ${movie.screeningTime}'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(movie.synopsis),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: cinemaBrand,
                foregroundColor: cinemaFontWhite,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              onPressed: () {
                debugPrint('Booking ${movie.title}');
              },
              child: const Text('Book Tickets'),
            ),
          ],
        ),
      ),
    );
  }
}