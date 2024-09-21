// ignore_for_file: prefer_const_constructors

import 'package:app/admin/Screens/Blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';
import 'my_drawertile.dart';
import 'my_themetoggle.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          SizedBox(height: 35,),
          Padding(padding: EdgeInsets.all(5),child: Divider(
            // color: Theme.of(context).colorScheme.secondary,
          ),),
          // app logo
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage:  NetworkImage(
                    'https://img.freepik.com/premium-vector/avatar-icon002_750950-52.jpg?w=740',
                  ),
                ),
              ),
              SizedBox(width: 8,),
              Text('Dennik John',
                style: GoogleFonts.outfit(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:  Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          themetoggle(),
          Padding(padding: EdgeInsets.all(5),child: Divider(
          ),),

          // home list tile
          MyDrawerTile(text: 'H O M E',
            onTap: (){},
            icon: Icons.home,
          ),
          // blockbuster deal
          MyDrawerTile(text: 'B L O C K  B U S T E R',
            onTap: (){},
            icon: Icons.camera_outlined,
          ),
          // funiture
          MyDrawerTile(text: 'F U N I T U R E',
            onTap: (){},
            icon: Icons.table_bar_sharp,
          ),
          // blog
          MyDrawerTile(text: 'B L O G',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Blog()));
            },
            icon: Icons.newspaper_sharp,
          ),
          // track order
          MyDrawerTile(text: 'T R A C K  O R D E R ',
            onTap: (){},
            icon: Icons.track_changes_sharp,
          ),
          // About us
          MyDrawerTile(text: 'A B O U T  U S',
            onTap: (){},
            icon: Icons.account_box_outlined,
          ),
          // privacy policy
          MyDrawerTile(text: 'P R I V A C Y  P O L I C Y',
            onTap: (){},
            icon: Icons.privacy_tip_rounded,
          ),
          // return policy
          MyDrawerTile(text: 'R E T U R N  P O L I C Y',
            onTap: (){},
            icon: Icons.keyboard_return_sharp,
          ),
          // settings list tile
          //logout list tile
          MyDrawerTile(text: 'L O G O U T',
            onTap: (){},
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
