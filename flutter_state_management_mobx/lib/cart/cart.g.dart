// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Cart on _Cart, Store {
  Computed<double> _$cartValueComputed;

  @override
  double get cartValue =>
      (_$cartValueComputed ??= Computed<double>(() => super.cartValue)).value;
  Computed<List<Product>> _$uniqueProductsComputed;

  @override
  List<Product> get uniqueProducts => (_$uniqueProductsComputed ??=
          Computed<List<Product>>(() => super.uniqueProducts))
      .value;

  final _$_cartContentAtom = Atom(name: '_Cart._cartContent');

  @override
  ObservableList<Product> get _cartContent {
    _$_cartContentAtom.context.enforceReadPolicy(_$_cartContentAtom);
    _$_cartContentAtom.reportObserved();
    return super._cartContent;
  }

  @override
  set _cartContent(ObservableList<Product> value) {
    _$_cartContentAtom.context.conditionallyRunInAction(() {
      super._cartContent = value;
      _$_cartContentAtom.reportChanged();
    }, _$_cartContentAtom, name: '${_$_cartContentAtom.name}_set');
  }

  final _$_freightAtom = Atom(name: '_Cart._freight');

  @override
  double get _freight {
    _$_freightAtom.context.enforceReadPolicy(_$_freightAtom);
    _$_freightAtom.reportObserved();
    return super._freight;
  }

  @override
  set _freight(double value) {
    _$_freightAtom.context.conditionallyRunInAction(() {
      super._freight = value;
      _$_freightAtom.reportChanged();
    }, _$_freightAtom, name: '${_$_freightAtom.name}_set');
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
  void removeProduct(Product product) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.removeProduct(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAllFromCart(Product product) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.removeAllFromCart(product);
    } finally {
      _$_CartActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeQuantity(Product product, int quantity) {
    final _$actionInfo = _$_CartActionController.startAction();
    try {
      return super.changeQuantity(product, quantity);
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
