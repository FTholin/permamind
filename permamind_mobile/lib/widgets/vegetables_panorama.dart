import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';

/*
* Widget that handle the vegetables selected to send to the model.
* */
class VegetablesPanorama extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new VegetablesPanoramaState();
  }
}
class VegetablesPanoramaState extends State<VegetablesPanorama> {

  List<VegetableItem> _veggies = <VegetableItem>[];
  VegetableBloc _vegBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 2,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(_veggies.length, (index) {
            return Center(

              child: Container(
                height: 150,
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: <Widget>[
                    new Image.asset('assets/vegetables/${_veggies[index].vegetableName}.png', width: 90.0, height: 90.0),
                    new Text(
                      '${_veggies[index].vegetableName}',
                      style: Theme.of(context).textTheme.headline,
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(60.0),
                    border: Border.all(
                        color: Colors.green,
                        width: 2.0
                    )
                ),
              )

//
//              Text(
//                'Item $index',
//                style: Theme.of(context).textTheme.headline,
//              ),
            );
          }
          ),
        ),
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
        setState(() =>  _veggies.add(veg))
    );
  }
}