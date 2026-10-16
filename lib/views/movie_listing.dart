import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieOrder extends StatefulWidget {
  final Movie movie;

  const MovieOrder({super.key, required this.movie});

  @override
  State<MovieOrder> createState() {
    return _MovieOrderState();
  }
}

class _MovieOrderState extends State<MovieOrder> {
  int ticketQuantity = 0;
  String orderMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(appTitle, style: cinemaHeaderStyle),
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: Padding(
          padding: EdgeInsets.all(cinemaPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              late double largeSpacing;
              if (constraints.maxWidth < 600) {
                largeSpacing = cinemaLargeSpacing / 2;
              } else {
                largeSpacing = cinemaLargeSpacing;
              }
              return ListView(
                children: [
                  Text(widget.movie.title, style: cinemaHeaderStyle),
                  SizedBox(height: largeSpacing),
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Image.asset(
                      widget.movie.posterImagePath,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          const SizedBox(height: 10),
                          Text(widget.movie.synopsis),
                        ]))
                  ]),
                  Text("Southsea Cinama Room"),
                  Text("Screening time: ${widget.movie.screeningTime}"),
                  Text("Age rating: ${widget.movie.ageRating}"),
                  Text("Runtime: ${widget.movie.runtime}"),
                  SizedBox(height: largeSpacing),
                  Text(
                      "Please note that any discounts / membership benifits will be applied once you have selected your tickets and proceed to checkout."),
                  SizedBox(height: largeSpacing),
                  Text("Select Quantity (Max 5)"),
                  Text("Tickets", style: cinemaHeaderStyle),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    spacing: 20,
                    children: [
                      DropdownMenu<int>(
                        initialSelection: 0,
                        textStyle: TextStyle(color: cinemaFontWhite),
                        menuStyle: MenuStyle(
                          backgroundColor:
                              WidgetStatePropertyAll(cinemaFontWhite),
                        ),
                        onSelected: (int? value) {
                          if (value != null) {
                            setState(() {
                              ticketQuantity = value;
                            });
                          }
                        },
                        dropdownMenuEntries: [
                          DropdownMenuEntry(value: 0, label: "No Tickets"),
                          DropdownMenuEntry(value: 1, label: "1 Ticket"),
                          DropdownMenuEntry(value: 2, label: "2 Tickets"),
                          DropdownMenuEntry(value: 3, label: "3 Tickets"),
                          DropdownMenuEntry(value: 4, label: "4 Tickets"),
                          DropdownMenuEntry(value: 5, label: "5 Tickets"),
                        ],
                      ),
                      Text("£${widget.movie.formattedPrice} each"),
                    ],
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cinemaBrand,
                      foregroundColor: cinemaFontWhite,
                    ),
                    onPressed: () {
                      if (ticketQuantity == 0) {
                        setState(() {
                          orderMessage =
                              "Please select at least 1 ticket to order";
                        });
                      } else {
                        setState(() {
                          final total =
                              (widget.movie.ticketPrice * ticketQuantity)
                                  .toStringAsFixed(2);

                          orderMessage =
                              "you have ordered $ticketQuantity ticket(s) for a total of $total";
                        });
                      }
                    },
                    child: const Text("Order Tickets"),
                  ),
                  Text(orderMessage),
                ],
              );
            },
          ),
        ));
  }
}

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
