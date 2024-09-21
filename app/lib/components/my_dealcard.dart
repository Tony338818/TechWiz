import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class DealCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '25% Deals Today',
              style: GoogleFonts.outfit(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color:  Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Get discount for every order, only valid for today',
              // style: Theme.of(context).textTheme.bodyMedium,
              style: GoogleFonts.aboreto(
                fontSize: 13,
                fontWeight: FontWeight.w700,
                color:  Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Theme.of(context).colorScheme.onPrimary),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                )),
              ),
              child: Text('Buy Now',
                style: GoogleFonts.outfit(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color:  Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
