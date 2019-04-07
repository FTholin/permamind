import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/plus_minus_button.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';
import 'package:permamind_mobile/widgets/VeggieItemWidget.dart';

class VeggiesSelectionPage extends StatelessWidget {


  final GardenDesignerBloc bloc;

  VeggiesSelectionPage({
    Key key,
    this.bloc,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {

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
                      gardenBloc: bloc,
                    );
                  },
                );
              },
            ),
          ),
        ));
  }
}

