import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';

///
///
///Cart Model
///
///Sepet
///
///
class CartModel extends ChangeNotifier {
  final Map<Food, int> _cartItems = {};

  Map<Food, int> get items => _cartItems;

  double get totalPrice => _cartItems.entries
      .fold(0, (sum, entry) => sum + (entry.key.price * entry.value));

//Yemek Ekleme

  void addToCart(Food product) {
    if (_cartItems.containsKey(product)) {
      _cartItems[product] = _cartItems[product]! + 1;
    } else {
      _cartItems[product] = 1;
    }
    notifyListeners();
  }

  //1 adet Yemek Çıkarma

  void removeOneFromCart(Food product) {
    if (_cartItems.containsKey(product)) {
      if (_cartItems[product]! > 1) {
        _cartItems[product] = _cartItems[product]! - 1;
      } else {
        _cartItems.remove(product);
      }
      notifyListeners();
    }
  }
//Hepsini çıkarma

  void removeAllFromCart(Food product) {
    _cartItems.remove(product);
    notifyListeners();
  }

//Sepeti Temizle

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
