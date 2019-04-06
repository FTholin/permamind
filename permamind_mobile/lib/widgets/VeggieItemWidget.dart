import 'package:flutter/material.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/vegetableItemBloc.dart';

import 'dart:async';


class VegetableItemWidget extends StatefulWidget {
  VegetableItemWidget({
    Key key,
    @required this.vegetableItem,
  }) : super(key: key);

  final VegetableItem vegetableItem;

  @override
  _VegetableItemWidgetState createState() => _VegetableItemWidgetState();
}

class _VegetableItemWidgetState extends State<VegetableItemWidget> {
  StreamSubscription _subscription;
  VegetableItemBloc _bloc;
  GardenDesignerBloc _gardenDesignerBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // As the context should not be used in the "initState()" method,
    // prefer using the "didChangeDependencies()" when you need
    // to refer to the context at initialization time
    _initBloc();
  }

  @override
  void didUpdateWidget(VegetableItemWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    // as Flutter might decide to reorganize the Widgets tree
    // it is preferable to recreate the links
    _disposeBloc();
    _initBloc();
  }

  @override
  void dispose() {
    _disposeBloc();
    super.dispose();
  }

  // This routine is reponsible for creating the links
  void _initBloc() {
    // Create an instance of the VegetableItemBloc
    _bloc = VegetableItemBloc(widget.vegetableItem);

    // Retrieve the BLoC that handles the Shopping Basket content 
    _gardenDesignerBloc = BlocProvider.of<GardenDesignerBloc>(context);

    // Simple pipe that transfers the content of the shopping
    // basket to the VegetableItemBloc
    _subscription = _gardenDesignerBloc.gardenVeggies.listen(_bloc.shoppingBasket);
  }

  void _disposeBloc() {
    _subscription?.cancel();
    _bloc?.dispose();
  }

  Widget _buildButton() {
    return StreamBuilder<bool>(
      stream: _bloc.isInShoppingBasket,
      initialData: false,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        return snapshot.data
            ? _buildRemoveFromGardenVeggies()
            : _buildAddToGardenVeggies();
      },
    );
  }

  Widget _buildAddToGardenVeggies(){
    return RaisedButton(
      child: Text('Add...'),
      onPressed: (){
        _gardenDesignerBloc.addToGardenVeggies(widget.vegetableItem);
      },
    );
  }

  Widget _buildRemoveFromGardenVeggies(){
    return RaisedButton(
      child: Text('Remove...'),
      onPressed: (){
        _gardenDesignerBloc.removeFromGardenVeggies(widget.vegetableItem);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.amber,
          child: Center(
            child: _buildButton(),
          ),
        );
  }
}