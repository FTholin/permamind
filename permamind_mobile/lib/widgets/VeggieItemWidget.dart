import 'package:flutter/material.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/vegetableItemBloc.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
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
    //_bloc = VegetableItemBloc(widget.vegetableItem);

    // Retrieve the BLoC that handles the Shopping Basket content 
    _gardenDesignerBloc = BlocProvider.of<GardenDesignerBloc>(context);

    // Simple pipe that transfers the content of the shopping
    // basket to the VegetableItemBloc
    //_subscription = _gardenDesignerBloc.gardenVeggies.listen(_bloc.shoppingBasket);
  }

  void _disposeBloc() {
   // _subscription?.cancel();
    _bloc?.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title:Column(
            children: <Widget>[
              Text(
                widget.vegetableItem.vegetableName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PlusMinusButton(height:40,
                  width:100,
                  vegetableItem: widget.vegetableItem)
            ],
          ),
          leading: Container(
              margin: EdgeInsets.only(left: 6.0),
              child: new Image.asset('assets/vegetables/${widget.vegetableItem.vegetableName}.png', width: 70.0, height: 70.0)
          ),
        ),
        Divider()
      ],
    );
  }
}