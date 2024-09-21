import 'package:app/components/my_blockbuster.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class blockbusterheader extends StatelessWidget {
  final String title;
  final Function onViewAll;

  blockbusterheader({required this.title, required this.onViewAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
            // style: Theme.of(context).textTheme.headlineSmall
            style: GoogleFonts.outfit(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color:  Theme.of(context).colorScheme.primary,
            ),
          ),
          GestureDetector(
            onTap: () => onViewAll(),
            child: Text(
              'View All',
              // style: Theme.of(context).textTheme.titleMedium
              style: GoogleFonts.outfit(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color:  Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
