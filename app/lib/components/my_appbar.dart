import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'my_drawer.dart';
class CustomAppBar extends StatelessWidget  implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(145);
  TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.background,
      elevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text(
            'Find your',
            style: GoogleFonts.outfit(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color:  Theme.of(context).colorScheme.primary,
            ),
          ),
          Text(
            'Perfect furniture',
            // style: Theme.of(context).textTheme.headlineSmall,
            style: GoogleFonts.outfit(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color:  Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        IconButton(icon: Icon(Icons.notifications_none), onPressed: () {}),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 20,left: 12,right: 12,bottom: 10),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search Furniture Product',
              hintStyle: TextStyle(
                fontSize: 15,
                color:  Theme.of(context).colorScheme.primary,
              ),
              suffixIcon: IconButton(
                onPressed: (){},
                icon: Icon(Icons.search),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide.none
              ),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
  // @override
  // Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
