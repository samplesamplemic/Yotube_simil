import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatelessWidget {
  Color navbarColor = Colors.deepPurple[200]!;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: Color.fromARGB(229, 214, 214, 1000),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 35,
            ),
          ),
          TextButton(
            onPressed: () {
              // FetchAPI.fetchVideo();
            },
            style: TextButton.styleFrom(
              textStyle: GoogleFonts.ingridDarling(
                  fontWeight: FontWeight.w400, fontSize: 30, color: Colors.white),
            ),
            child: const Text('Info'),
          ),
        ],
      ),
    );
  }
}
