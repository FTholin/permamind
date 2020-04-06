import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';
import 'package:data_repository/data_repository.dart';

class FilteredModelings extends StatelessWidget {
  final List<Modeling> modelings;
  final Parcel parcel;
  final String gardenId;

  FilteredModelings({
    this.parcel,
    this.modelings,
    this.gardenId,
    Key key}) : assert(parcel != null), assert(gardenId != null), assert(modelings != null), super(key: key);

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
              key: ArchSampleKeys.todoList,
              itemCount: modelings.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 3) ),

              itemBuilder: (BuildContext context, int index) {

                return InkResponse(
                  enableFeedback: true,
                  child: Card(
                    child: Column(
//                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Flexible(
                          flex: 3,
                            child: Image(
                              image: AssetImage('assets/modelings/${modelings[index].name}.png'),
                              fit: BoxFit.cover
                            )
                        ),
                        Text("${modelings[index].composition.join("-")}"),
                      ],
                    ),
                  ),
                  onTap: () async {




                    await Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) {
                          return DetailsModelingScreen(
                              gardenId: gardenId,
                              parcel: parcel,
                              modeling: modelings[index],
                              schedule: modelings[index].schedule,
                              designs: modelings[index].designs
                          );
                        })
                    );

                    Navigator.pop(context);
                  },
                );
              },
            );
  }
}