import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  const GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      this.color, required this.onPressed, required this.itemQuality});
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final VoidCallback onPressed;
  // ignore: prefer_typing_uninitialized_variables
  final  color;
  final int itemQuality;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 64,
            ),
            Text(itemName),
            MaterialButton(
              onPressed: (itemQuality > 0)?onPressed:() {
                const snackBar = SnackBar(
  content: Text('Out of Stock!'),
);

               ScaffoldMessenger.of(context).showSnackBar(snackBar);
                
                
                
                return;
              },
              color: color[800],
              child: Text(
               '\$ $itemPrice',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
