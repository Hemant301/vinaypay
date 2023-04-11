class CartModal {
  dynamic status;
  List<CartProductModal> products = [];

  CartModal(js) {
    status = js['status'] ?? "";

    if (status.toString() == "0") {
      products.clear();
    } else {
      for (var i = 0; i < js['data'].length; i++) {
        products.add(CartProductModal(js['data'][i]));
      }
    }
  }
}

class CartProductModal {
  dynamic productId;
  CartProductModal(js) {
    productId = js['prod_id'] ?? "";
  }
}
