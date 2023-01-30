import 'package:flutter/material.dart';

class ShoesModels extends ChangeNotifier {
  String _assetsImage = 'assets/azul.png';
  double _talla = 9.0;
  double _heightShoes = 225;
  double get heightShoes => _heightShoes;

  set heightShoes(double value) {
    _heightShoes = value;
    notifyListeners();
  }

  String get assetsImage => _assetsImage;

  set assetsImage(String value) {
    _assetsImage = value;
    notifyListeners();
  }

  double get talla => _talla;

  set talla(double value) {
    _talla = value;
    notifyListeners();
  }
}
