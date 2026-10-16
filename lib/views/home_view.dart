import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = MovieRepository().getMovies();
    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
        ),
        drawer: const NavDrawer(),
        body: ListView(
          padding: EdgeInsets.all(cinemaPadding),
          children: [
            Text("Now Showing", style: cinemaHeaderStyle),
            for (final movie in movies) MovieCard(movie: movie),
          ],
        ));
  }
}
