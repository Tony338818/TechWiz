// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_container.dart';
import 'profile_pic.dart';

class ProfilePage extends StatefulWidget {
  final String email;
  // final List<Map<String, String>> notifications;

  const ProfilePage({super.key, required this.email});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _profileImageUrl; // This will store the profile image URL
  String? username;

  @override
  void initState() {
    super.initState();
    loadUserProfile();
    _getEcoPoints(); // Fetch eco points from Firebase
  }

  Future<void> loadUserProfile() async {
    try {
      // Fetch the user profile document from Firestore
      DocumentSnapshot<Map<String, dynamic>> userProfile =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get();

      if (userProfile.exists) {
        // Check and handle the "profileImage" field
        String? profileImageUrl;
        if (userProfile.data()!.containsKey('profileImage')) {
          profileImageUrl = userProfile.data()!['profileImage'];
        } else {
          print('Profile image not set');
        }

        // Check and handle the "name" field
        String username = userProfile.data()!['username'] ?? 'No name set';

        setState(() {
          _profileImageUrl = profileImageUrl;
          this.username = username;
        });
      } else {
        print('User profile does not exist');
      }
    } catch (e) {
      print('Failed to load user profile: $e');
    }
  }

  int ecoPoints = 0; // Eco points initialized to 0

  // Function to fetch eco points from Firestore
  Future<int> _getEcoPoints() async {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        print("User is not logged in");
        return 0;
      }
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userDoc.exists) {
        return userDoc.data()?['ecoPoints'] ?? 0;
      } else {
        print("User document not found");
        return 0;
      }
    } catch (e) {
      print("Error fetching eco points: $e");
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => (context),
                //   ),
                // );
              },
              icon: Icon(Icons.notifications))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profilepic(
                //   onImageSelected: (String imagePath) {
                //     // Update the profile image URL and reload the profile
                //     setState(() {
                //       _profileImageUrl = imagePath;
                //     });
                //     loadUserProfile();
                //   },
                //   imageUrl: _profileImageUrl, // Pass the image URL
                //   showCameraIcon: false, // Ensure the camera icon is not shown
                // ),
                CircleAvatar(
                  maxRadius: 60,
                  child: ClipOval(
                    child: Image.network(
                      'https://storage.vivago.ai/image/p_e70e5760-76a9-11ef-81f1-6e8bfdc1f9a6.jpg?width=512',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(height: 20),
                Text(
                  'Hi, ${username ?? 'User'}!',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'user001@gmail.com',
                  style: GoogleFonts.roboto(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 20),
            ProfileContainer(),
            SizedBox(height: 50),
            ElevatedButton(
                onPressed: () {},
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout),
                      SizedBox(
                        width: 10,
                      ),
                      Text('LogOut')
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
