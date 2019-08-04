// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$Cart on _Cart, Store {
  final _$cartContentAtom = Atom(name: '_Cart.cartContent');

  @override
  ObservableList<Product> get cartContent {
    _$cartContentAtom.context.enforceReadPolicy(_$cartContentAtom);
    _$cartContentAtom.reportObserved();
    return super.cartContent;
  }

  @override
  set cartContent(ObservableList<Product> value) {
    _$cartContentAtom.context.conditionallyRunInAction(() {
      super.cartContent = value;
      _$cartContentAtom.reportChanged();
    }, _$cartContentAtom, name: '${_$cartContentAtom.name}_set');
  }

  final _$_CartActionController = ActionController(name: '_Cart');

  @override
  void addToCart(Product product) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.addToCart(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeOneCart(Product product) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.removeOneCart(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAllFromCart(Product removeProduct) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.removeAllFromCart(removeProduct);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeQuantity(Product removeProduct, double quantity) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.changeQuantity(removeProduct, quantity);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyCart() {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.emptyCart();
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }
}
