import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethods extends StatefulWidget {
  @override
  _PaymentMethodsState createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollController = ScrollController();
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    )..addListener(() {
      _scrollController.jumpTo(_animationController.value *
          _scrollController.position.maxScrollExtent);
    });

    // Start the animation loop
    _animationController.repeat();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'We accept all these cards',
            style: GoogleFonts.eagleLake(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 30, // Maintains the height of 30 for the images
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: 20, // Repeat the card logos multiple times for effect
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/4/41/Visa_Logo.png',
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2560px-PayPal.svg.png',
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTeGbX2GrtWRR7UroYvXBm8o-wDo1Trj7bM8g&s',
                      height: 30,
                    ),
                    SizedBox(width: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
