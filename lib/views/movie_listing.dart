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
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text("The Lord Of The Rings: The Fellowship of the Ring",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text("The Lord of the Rings: The Fellowship of the Ring is a 2001 epic fantasy adventure film directed by Peter Jackson, based on the first volume of J. R. R. Tolkien's The Lord of the Rings. It follows the story of the fellowship, a group coming from all over middle earth united for one goal. The Destruction of the one ring."),
            SizedBox(height: 20),
            Text("Southsea Cinama Room"),
            Text("Tuesday 20th June 2027 17:30 - ends at 19:30"),
            Text("Please note that any discounts / membershib benifits will be applied once you have selected your tickets and proceed to checkout."),
            SizedBox(height: 20),
            Text("Select Quantity (Max 5)"),
            Text("Select Ticket"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                Text("Dropdown Button Here"),
                Text("Ticket Details Here"),
              ],
            ),
            SizedBox(height: 20),
            Text("Place Order Button Here"),
          ],
        ),
      ),
    );
  }
}
