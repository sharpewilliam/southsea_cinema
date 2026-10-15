import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';


class MovieOrder extends StatefulWidget {
  const MovieOrder({super.key, required Movie movie});

  @override
  State<MovieOrder> createState() {
    return _MovieOrderState();
  }
}

class _MovieOrderState extends State<MovieOrder> {
  final movies = MovieRepository().getMovies();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  final movies = MovieRepository().getMovies();

  @override
  Widget build(BuildContext context) {
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
          for (final movie in movies)
            MovieCard(movie: movie),
        ],
      )
    );
  }
}