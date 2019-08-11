import 'package:mobx/mobx.dart';
import 'package:state_management_example/models/product.dart';

part 'cart.g.dart';

class Cart = _Cart with _$Cart;

abstract class _Cart with Store {
  _Cart() {
    addFreigthReaction =
        reaction((_) => cartContent.length, (int cartItemCount) {
      if (cartItemCount >= 10 && freight == 0) {
        freight = 20;
      } else if (cartItemCount < 10 && freight != 0) {
        freight = 0;
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

  Function addFreigthReaction;

  @observable
  ObservableList<Product> cartContent = ObservableList<Product>();

  @observable
  double freight = 0;

  @computed
  int getProductQuantity(Product product) =>
      ObservableList.of(cartContent.where((p) => p == product)).length;

  @computed
  double getProductValue(Product product) {
    return ObservableList.of(cartContent.where((p) => p == product))
        .fold<double>(0, (totalValue, product) => totalValue + product.price);
  }

  @computed
  double get cartValue => ObservableList.of(cartContent)
      .fold<double>(0, (totalValue, product) => totalValue + product.price);

  @computed
  List<Product> get uniqueProducts =>
      ObservableList.of(cartContent).toSet().toList();

  @action
  void addToCart(Product product) {
    cartContent.add(product);
  }

  @action
  void removeOneCart(Product product) {
    cartContent.remove(product);
  }

  @action
  void removeAllFromCart(Product product) {
    cartContent.removeWhere((p) => product == p);
  }

  @action
  void changeQuantity(Product product, int quantity) {
    int difference = quantity - getProductQuantity(product);
    while (difference != 0) {
      if (difference > 0) {
        addToCart(product);
        difference--;
      } else if (difference < 0) {
        removeOneCart(product);
        difference++;
      }
    }
  }

  @action
  void emptyCart() {
    cartContent.clear();
  }

  @override
  void dispose() {
    addFreigthReaction();
    super.dispose();
  }
}
