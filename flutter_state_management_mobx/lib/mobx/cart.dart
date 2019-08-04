import 'package:mobx/mobx.dart';
import 'package:state_management_example/models/product.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  @observable
  ObservableList<Product> cartContent = ObservableList<Product>();

  @computed
  double getProductQuantity(Product product) => ObservableList.of(cartContent
          .where((productInCart) => productInCart.name == product.name))
      .length
      .toDouble();

  @computed
  double getProductValue(Product product) {
    final productList = ObservableList.of(cartContent
        .where((productInCart) => productInCart.name == product.name));
    double value = 0;
    for (var product in productList) {
      value += product.price;
    }
    return value;
  }

  @computed
  double getCartValue() {
    final productList = ObservableList.of(cartContent);
    double value = 0;
    for (var product in productList) {
      value += product.price;
    }
    return value;
  }

  @computed
  List<Product> uniqueProducts() {
    final unique = List<String>();
    return ObservableList.of(cartContent).where((product) {
      if (!unique.contains(product.name)) {
        unique.add(product.name);
        return true;
      } else {
        return false;
      }
    }).toList();
  }

  @action
  void addToCart(Product product) {
    cartContent.add(product);
  }

  @action
  void removeOneCart(Product product) {
    cartContent.remove(product);
  }

  @action
  void removeAllFromCart(Product removeProduct) {
    cartContent.removeWhere((product) => removeProduct.name == product.name);
  }

  @action
  void changeQuantity(Product removeProduct, double quantity) {
    double differens = quantity - getProductQuantity(removeProduct);
    while (differens != 0) {
      if (differens > 0) {
        addToCart(removeProduct);
        differens--;
      } else if (differens < 0) {
        removeOneCart(removeProduct);
        differens++;
      }
    }
  }

  @action
  void emptyCart() {
    cartContent = ObservableList<Product>();
  }
}
