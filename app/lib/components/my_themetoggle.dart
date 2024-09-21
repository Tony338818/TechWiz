import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/theme_provder.dart';
class themetoggle extends StatelessWidget {
  const themetoggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(left: 25,top: 10,right: 15),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // text
          Text('Dark Mode',style:
          TextStyle(fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary),),
          // switch
          CupertinoSwitch(
              value: Provider.of<ThemeProvider>(context, listen: false).isDarkMode,
              onChanged:(value){
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              }
          ),
          // Image.asset('assets/burger/hamburger.jpg')
        ],
      ),
    );
  }
}
