import 'package:flutter/material.dart';

import 'coffee.dart';

class CoffeeShop extends ChangeNotifier{

  //coffee for sale list

  final List<Coffee> _shop =[
    //black coffee
      Coffee(name: 'Long Black', price: "5.50", imagePath: "lib/images/blackcoffee.png"),

    //latte
      Coffee(name: 'Latte', price: "10", imagePath: "lib/images/latte.png"),

    //espresso
      Coffee(name: 'Espresso', price: "8.50", imagePath: "lib/images/espressocoffee.png"),

    //iced coffee
      Coffee(name: 'Iced Coffee', price: "9.50", imagePath: "lib/images/icedcoffee.png")

  ];

  //user cart

  List<Coffee> _userCart = [

  ];

  //get coffee list

    List<Coffee> get coffeeShop=> _shop;

  //get user cart

  List<Coffee> get userCart=> _userCart;

  //add item to cart

  void addItemToCart(Coffee coffee){
    _userCart.add(coffee);
    notifyListeners();

  }

  //remove item from cart

  void removeItemFromCart(Coffee coffee){
    _userCart.remove(coffee);
    notifyListeners();
  }






}