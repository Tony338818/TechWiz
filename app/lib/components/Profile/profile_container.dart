// ignore_for_file: prefer_const_constructors

import 'package:app/components/Profile/user_consultation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'about_app.dart';
import 'editprofile.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          MyListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Editprofile()));
              },
              text: 'Edit personal information',
              trail: Icon(Icons.person_outline, color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutApp()));
              },
              text: 'Order history',
              trail: Icon(Icons.book, color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => UserConsultation()));
              },
              text: 'Consultations',
              trail: Icon(Icons.cabin, color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutApp()));
              },
              text: 'Support Center',
              trail: Icon(Icons.help, color: Colors.black)),
          SizedBox(
            height: 10,
          ),
          MyListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutApp()));
              },
              text: 'legal policy',
              trail: Icon(Icons.laptop_windows, color: Colors.black)),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Widget? trail;
  const MyListTile(
      {super.key,
      required this.onTap,
      required this.text,
      required this.trail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary, 
        borderRadius: BorderRadius.circular(12), 
      ),
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.roboto(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: onTap,
        trailing: trail,
      ),
    );
  }
}
