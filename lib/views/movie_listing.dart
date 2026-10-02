import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() {
    return _MovieListingState();
  }
}

class _MovieListingState extends State<MovieListing> {
  int ticketQuantity = 0;
  String orderMessage = "";

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
        body: Padding(
          padding: EdgeInsets.all(cinemaPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              late double mediumSpacing;
              late double largeSpacing;
              if (constraints.maxWidth < 600) {
                mediumSpacing = cinemaMediumSpacing / 2;
                largeSpacing = cinemaLargeSpacing / 2;
              } else {
                mediumSpacing = cinemaMediumSpacing;
                largeSpacing = cinemaLargeSpacing;
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: mediumSpacing,
                children: [
                  Text("The Lord Of The Rings: The Fellowship of the Ring",
                      style: cinemaHeaderStyle),
                  SizedBox(height: largeSpacing),
                  Text(
                      "The Lord of the Rings: The Fellowship of the Ring is a 2001 epic fantasy adventure film directed by Peter Jackson, based on the first volume of J. R. R. Tolkien's The Lord of the Rings. It follows the story of the fellowship, a group coming from all over middle earth united for one goal. The Destruction of the one ring."),
                  SizedBox(height: largeSpacing),
                  Text("Southsea Cinama Room"),
                  Text("Tuesday 20th June 2027 17:30 - ends at 19:30"),
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
                      Text("£4.50 each"),
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
                          orderMessage =
                              "you have ordered $ticketQuantity ticket(s)";
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
