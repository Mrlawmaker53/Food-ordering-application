import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_assignment/pages/home_screen/controller/card_controller.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CartController>(
      builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.cardITems.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(8)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cardITems[index][2],
                          height: 36,
                        ),
                        title: Text(
                          value.cardITems[index][0],
                        ),
                        subtitle: Text(
                          value.cardITems[index][1],
                        ),
                        trailing: IconButton(
                          icon:
                          const Icon(Icons.cancel),
                          onPressed: (){
                            Provider.of<CartController>(context,listen: false).removeIntoCard(index);
                          },
                          ) ,
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(12),),
                
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Text('Total Price'),
                          Text(value.calculatorTotal()),
                          
                        ],
                      ),
                    
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('Pay Now  ',style: TextStyle(color: Colors.white),),
                         Icon(Icons.arrow_back,color: Colors.white,)
                          ],
                        ),
                      ),
                    )
                    ],
                  ),
                ),),
            )
          ],
        );
      },
    ));
  }
}
