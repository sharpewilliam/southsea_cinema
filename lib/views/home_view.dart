import 'package:flutter/material.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movie.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Movie> _movies = [];
  bool _loading = true;
  String _errorMessage = '';
  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = await repository.loadMoviesFromAsset();

      if (!mounted) {
        return;
      }

      setState(() {
        _movies = movies;
        _loading = false;
      });
    } catch (error) {
      if (!mounted) {
        return;
      }

      setState(() {
        _errorMessage = 'Could not load movies: $error';
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget content;

    if (_loading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_errorMessage.isNotEmpty) {
      content = Center(
        child: Text(_errorMessage),
      );
    } else {
      content = ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(movie: _movies[index]);
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Southsea Cinema'),
      ),
      drawer: const NavDrawer(),
      body: content,
    );
  }
}
