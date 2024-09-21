import 'package:app/models/blockbuster_productlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/all_blockbusterdeals.dart';
class BlockBusterscreen extends StatelessWidget {
  const BlockBusterscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text(
          'BlockBuster Deals!',
          style: GoogleFonts.outfit(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color:  Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlockbusterProductlist(),
        ),
      ),
    );
  }
}
