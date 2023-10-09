import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_assignment/pages/card_screen/card_screen.dart';
import 'package:quizz_assignment/pages/home_screen/controller/card_controller.dart';

import '../../../utlits/common_widgets/grocery_item_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return const CardScreen();
            },
          ),
        ),
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 48,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text("Good morning,"),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Let's order fresh items for you",
                  style: TextStyle(fontSize: 36),
                )),
            const SizedBox(
              height: 24,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(
                thickness: 4,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Fresh item',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Expanded(
              child: Consumer<CartController>(
                builder: (context, value, child) {
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.3),
                    itemCount: value.shopItems.length,
                    itemBuilder: (_, index) {
                      return GroceryItemTile(
                        itemName: value.shopItems[index][0],
                        itemPrice: value.shopItems[index][1],
                        imagePath: value.shopItems[index][2],
                        color: value.shopItems[index][3],
                        onPressed: () {
                          Provider.of<CartController>(context, listen: false)
                              .addIntoCard(index);
                          Provider.of<CartController>(context, listen: false)
                              .itemQuantity(index);
                        },
                        itemQuality: value.shopItems[index][4],
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
