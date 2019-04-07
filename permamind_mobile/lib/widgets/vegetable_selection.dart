import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';
import 'package:permamind_mobile/widgets/VeggieItemWidget.dart';

//* Widget that handle the vegetables selected to send to the model.
//* */
//class VeggiesSelectionList extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return new VeggiesSelectionListState();
//  }
//}
//class VeggiesSelectionListState extends State<VeggiesSelectionList> {
//
//  List<VegetableItem> _veggies = <VegetableItem>[];
//  VegetableBloc _vegBloc;
//
//  @override
//  Widget build(BuildContext context) {
//    return Column(
//      children: <Widget>[
////        new TextField(
////          decoration: new InputDecoration.collapsed(hintText: 'Recherche'),
////        ),
//        Expanded(
//          child: ListView.builder(
//            itemCount: _veggies.length,
//            itemBuilder: (context, index) => VegTile(_veggies[index]),
//          ),
//        )
//      ],
//    );
//  }
//
//
//  @override
//  void initState() {
//    super.initState();
//    _vegBloc = BlocProvider.of<VegetableBloc>(context);
//    listenForVeggies();
//  }
//
//  void listenForVeggies() async {
//    final Stream<VegetableItem> stream = await _vegBloc.fetchVeggies();
//    stream.listen((VegetableItem veg) =>
//        setState(() =>  _veggies.add(veg))
//    );
//  }
//}
//
//class VegTile extends StatelessWidget {
//  final VegetableItem _veg;
//  VegTile(this._veg);
//
//  @override
//  Widget build(BuildContext context) => Column(
//    children: <Widget>[
//      ListTile(
//        title:Column(
//            children: <Widget>[
//              Text(
//                _veg.vegetableName,
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//              PlusMinusButton(height: 40, width:100)
//            ],
//          ),
//        leading: Container(
//          margin: EdgeInsets.only(left: 6.0),
//            child: new Image.asset('assets/vegetables/${_veg.vegetableName}.png', width: 70.0, height: 70.0)
//        ),
//      ),
//      Divider()
//    ],
//  );
//}

class VeggiesSelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GardenDesignerBloc bloc = BlocProvider.of<GardenDesignerBloc>(context);

    return SafeArea(
        child: Scaffold(
          body: Container(
            child: StreamBuilder<List<VegetableItem>>(
              stream: bloc.items,
              builder: (BuildContext context,
                  AsyncSnapshot<List<VegetableItem>> snapshot) {
                if (!snapshot.hasData) {
                  return Container();
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return VegetableItemWidget(
                      vegetableItem: snapshot.data[index],
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}

