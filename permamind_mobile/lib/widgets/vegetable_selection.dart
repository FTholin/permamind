import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';

import 'package:permamind_mobile/models/vegetable_card.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';


class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}
class RandomWordsState extends State<RandomWords> {
  VegetableBloc _vegBloc;


  bool _isInit = false;


  @override
  Widget build(BuildContext context) {
    //_vegBloc = BlocProvider.of<VegetableBloc>(context);

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
  Widget _buildRow(VegetableCard veg) {
    return new ListTile(
      leading: Container(
        child: Image.network(veg.imagePath, height: 60.0, fit: BoxFit.fill)
      ),
      title: Column(
        children: <Widget>[
          Text(veg.vegetableName),
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
    final Stream<VegetableCard> stream = await _vegBloc.getVegetables();
    stream.listen((VegetableCard veg) =>
        setState(() =>  _vegBloc.veggies.add(veg))
    );
  }
}