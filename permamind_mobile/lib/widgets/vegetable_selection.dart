import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';

import 'package:permamind_mobile/models/vegetable_card.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';


void main() => runApp(new MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new RandomWords();
  }
}
class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}
class RandomWordsState extends State<RandomWords> {
  final _veggies = <VegetableCard>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new TextField(
          decoration: new InputDecoration.collapsed(hintText: 'Recherche'),
        ),
        Expanded(
          child:
            _buildSuggestions()
        )
      ],
    );
  }
  Widget _buildSuggestions() {
    return new ListView.builder(
        itemCount: _veggies.length,
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, i) => _buildRow(_veggies[i])
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
    listenForVeggies();
  }

  void listenForVeggies() async {
    final Stream<VegetableCard> stream = await getVegetables();
    stream.listen((VegetableCard veg) =>
        setState(() =>  _veggies.add(veg))
    );
  }
}