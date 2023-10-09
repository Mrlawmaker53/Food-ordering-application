
import 'package:flutter/material.dart';

class CartController extends ChangeNotifier{
final List _shopItems=[
["daram","45.00","lib/images/daram.png",Colors.green,2]
,["Banana","599.00","lib/images/banana.png",Colors.yellow,2]

,["chicken","4500.00","lib/images/chicken.png",Colors.brown,2]
,["pineapple","15.00","lib/images/pineapple.png",Colors.blue,2]

];

final List _cardItems=[];


get shopItems =>_shopItems;

get cardITems => _cardItems;

// added into card
void addIntoCard(int index){
  _cardItems.add(shopItems[index]);
  notifyListeners();
}

// remove from card
void removeIntoCard(int index){
  _cardItems.removeAt(index);
  notifyListeners();
}


void itemQuantity(int index){
  _shopItems[index][4]-=1;
  notifyListeners();
}

// calculator price

String calculatorTotal(){
  double total=0;
  for(int i=0;i< _cardItems.length;i++){
    total= total + double.parse( _cardItems[i][1]);
  }
return total.toStringAsFixed(2);
}
}