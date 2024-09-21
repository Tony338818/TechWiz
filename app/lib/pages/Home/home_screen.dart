import 'package:app/models/blockbuster_productlist.dart';
import 'package:app/pages/Home/block_busterscreen.dart';
import 'package:app/pages/Home/trending_screen.dart';
import 'package:flutter/material.dart';
import '../../components/my_appbar.dart';
import '../../components/my_blockbuster.dart';
import '../../components/my_blockbusterheader.dart';
import '../../components/my_category.dart';
import '../../components/my_checkoutgallery.dart';
import '../../components/my_dealcard.dart';
import '../../components/my_drawer.dart';
import '../../components/my_paymentmethod.dart';
import '../../components/my_sectiontitle.dart';
import '../../models/product_list.dart';

class HomePage extends StatelessWidget {
  final VoidCallback navigateToGallery; // Function to handle navigation

  HomePage({required this.navigateToGallery});

  @override
  Widget build(BuildContext context) {
    // Create a list of products from BlockbusterProductList
    final blockbusterProducts = BlockbusterProductlist().products; // Fetch products from BlockbusterProductList

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: CustomAppBar(),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // category
            CategoryList(),
            // discount deals
            DealCard(),
            // trending products title
            SectionTitle(title: 'Trending Products', onViewAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>TrendingScreen(),
                ),
              );
            }),
            // trending products
            ProductList(),  // The list of products displayed here
            // blockbuster deals header
            blockbusterheader(title: 'Blockbuster Deals', onViewAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>BlockBusterscreen(),
                ),
              );
            }),
            // blockbuster products with valid product list
            Blockbuster(products: blockbusterProducts),  // Pass products here
            // gallery view
            CheckoutOurGallery(onCollectionTap: (int index) {
              // Call the function to navigate to GalleryPage
              navigateToGallery();
            }),
            // payment types
            PaymentMethods(),
          ],
        ),
      ),
    );
  }
}
