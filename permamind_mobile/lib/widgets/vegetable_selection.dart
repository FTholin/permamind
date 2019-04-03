import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';

import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';

/*
* Widget that handle the vegetables selected to send to the model.
* */
class VeggiesSelectionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new VeggiesSelectionListState();
  }
}
class VeggiesSelectionListState extends State<VeggiesSelectionList> {
  VegetableBloc _vegBloc;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
//        new TextField(
//          decoration: new InputDecoration.collapsed(hintText: 'Recherche'),
//        ),
        Expanded(
          child:
            _buildSuggestions()
        )
      ],
    );
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
        itemCount:  _vegBloc.veggies.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
          return _buildRow(_vegBloc.veggies[i]);
      }
    );
  }
  Widget _buildRow(VegetableItem veg) {
    return new ListTile(
      leading: Container(
        color: Colors.red,
        height: 70,
        width: 70,
        // TODO ICI on charge une image dans Assets
       // child: new Image.asset('images/2.0x/test.png', scale: 2.0, width: 48.0, height: 48.0)
//        child: Image.network(veg.imagePath, height: 60.0, fit: BoxFit.fill)
      ),
      title: Column(
        children: <Widget>[
          Text(
            veg.vegetableName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          PlusMinusButton(height: 40, width:100)
        ],
      )
    );
  }

  @override
  void initState() {
    super.initState();
    _vegBloc = BlocProvider.of<VegetableBloc>(context);
    listenForVeggies();
  }

  void listenForVeggies() async {
    final Stream<VegetableItem> stream = await _vegBloc.fetchVeggies();
    stream.listen((VegetableItem veg) =>
        setState(() =>  _vegBloc.veggies.add(veg))
    );
  }
}