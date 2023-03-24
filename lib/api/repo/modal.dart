class CartModal {
  List<CartProductModal> products = [];

  CartModal(js) {
    for (var i = 0; i < js['data'].length; i++) {
      products.add(CartProductModal(js['data'][i]));
    }
  }
}

class CartProductModal {
  dynamic productId;
  CartProductModal(js) {
    productId = js['prod_id'] ?? "";
  }
}
