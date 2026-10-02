import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("The Lord Of The Rings: The Fellowship of the ring",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Text("This is a placeholder for the movie listing page. It will display a list of movies currently showing in the cinema."),
        ],
      ),
    );
  }
}
