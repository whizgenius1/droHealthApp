import 'package:dro_app/utility/export_models.dart';
import 'package:flutter/material.dart';

class ProductItem {
  String id;
  ProductsModel productsModel;
  int quantity;
  ProductItem(
      {required this.id, required this.productsModel, required this.quantity});
}

class ProductProvider extends ChangeNotifier {
  Map<String, ProductItem> _productItem = {};
  Map<String, ProductItem> get productItem => {..._productItem};

  int get itemLength => _productItem.length;

  num get totalPrice {
    num total = 0;
    _productItem.forEach((key, value) {
      total += (value.productsModel.price * value.quantity);
    });
    return total;
  }

  addProductItem(
      {required String id,
      required ProductsModel productsModel,
      required int quantity}) {
    _productItem.containsKey(id)
        ? _productItem.update(
            id,
            (ProductItem existingProductItem) => ProductItem(
                id: existingProductItem.id,
                productsModel: existingProductItem.productsModel,
                quantity: quantity))
        : _productItem.putIfAbsent(
            id,
            () => ProductItem(
                id: id, productsModel: productsModel, quantity: quantity));
    notifyListeners();
  }

  removeProductItem({required String id}) {
    _productItem.containsKey(id)
        ? _productItem.removeWhere((key, value) => key == id)
        : null;

    notifyListeners();
  }

  clearProductItem() {
    _productItem.clear();
    notifyListeners();
  }
}
