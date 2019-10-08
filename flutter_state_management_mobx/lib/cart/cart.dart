import 'package:mobx/mobx.dart';
import 'package:state_management_example/shared/models/product.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  _Cart() {
    _addFreigthReaction =
        reaction((_) => _cartContent.length, (int cartItemCount) {
      if (cartItemCount >= 10 && _freight == 0) {
        _freight = 20;
      } else if (cartItemCount < 10 && _freight != 0) {
        _freight = 0;
      }
    });
    /*
    autorun((_) {
      React to all observables and do something.
    });

    when((_) => cartContent.length == 10, () {
      React to cartContent and do something once.
    });
    */
  }

  Function _addFreigthReaction;

  @observable
  ObservableList<Product> _cartContent = ObservableList<Product>();

  ObservableList<Product> get cartContent => _cartContent;

  @observable
  double _freight = 0;

  double get freight => _freight;

  int getProductQuantity(Product product) =>
      ObservableList.of(_cartContent.where((p) => p == product)).length;

  double getProductValue(Product product) {
    return ObservableList.of(_cartContent.where((p) => p == product))
        .fold<double>(0, (totalValue, product) => totalValue + product.price);
  }

  @computed
  double get cartValue => ObservableList.of(_cartContent)
      .fold<double>(0, (totalValue, product) => totalValue + product.price);

  @computed
  List<Product> get uniqueProducts =>
      ObservableList.of(_cartContent).toSet().toList();

  @action
  void addToCart(Product product) {
    _cartContent.add(product);
  }

  @action
  void removeProduct(Product product) {
    _cartContent.remove(product);
  }

  @action
  void removeAllFromCart(Product product) {
    _cartContent.removeWhere((p) => product == p);
  }

  @action
  void changeQuantity(Product product, int quantity) {
    int difference = quantity - getProductQuantity(product);
    while (difference != 0) {
      if (difference > 0) {
        addToCart(product);
        difference--;
      } else if (difference < 0) {
        removeProduct(product);
        difference++;
      }
    }
  }

  @action
  void emptyCart() {
    _cartContent.clear();
  }

  @override
  void dispose() {
    _addFreigthReaction();
    super.dispose();
  }
}
