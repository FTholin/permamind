import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:rxdart/rxdart.dart';

class VegetableItemBloc implements BlocBase {

  // Stream to notify if the VegetableItemWidget is part of the shopping basket
  BehaviorSubject<bool> _isInShoppingBasketController = BehaviorSubject<bool>();
  Stream<bool> get isInShoppingBasket => _isInShoppingBasketController;

  // Stream that receives the list of all items, part of the shopping basket
  PublishSubject<List<VegetableItem>> _shoppingBasketController = PublishSubject<List<VegetableItem>>();
  Function(List<VegetableItem>) get shoppingBasket => _shoppingBasketController.sink.add;

  // Constructor with the 'identity' of the vegetableItem
  VegetableItemBloc(VegetableItem vegetableItem){
    // Each time a variation of the content of the shopping basket
    _shoppingBasketController.stream
    // we check if this vegetableItem is part of the shopping basket
        .map((list) => list.any((VegetableItem item) => item.id == vegetableItem.id))
    // if it is part
        .listen((isInShoppingBasket)
    // we notify the VegetableItemWidget 
    => _isInShoppingBasketController.add(isInShoppingBasket));
  }

  @override
  void dispose() {
    _isInShoppingBasketController?.close();
    _shoppingBasketController?.close();
  }
}