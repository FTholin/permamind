import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:permamind_mobile/arch_bricks/flutter_todos_keys.dart';
import 'package:data_repository/data_repository.dart';

class FilteredModelings extends StatelessWidget {
  final List<Modeling> modelings;
  final String gardenName;
  final bool gardenVisibility;
  final List<String> gardenMembers;

  FilteredModelings({this.modelings, this.gardenName, this.gardenVisibility, this.gardenMembers, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final todosBloc = BlocProvider.of<GardensBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

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
                          child: Image.asset(
                            'assets/modelisations/${modelings[index].modelingName}.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text("${modelings[index].modelingName}"),
                      ],
                    ),
                  ),
                  onTap: () async {

                      // TODO retrieve all form infos and transfer them

                    final todo = await Navigator.pushNamed(context,
                      ArchSampleRoutes.detailsModeling,
                      arguments: DetailsModelingsScreenArguments(
                          modeling: modelings[index],
                          gardenName: gardenName,
                          publicVisibility: gardenVisibility,
                          gardenMembers: gardenMembers,
                          schedule: modelings[index].schedule

                      ),
                    );
//
//                    final removedTodo = await Navigator.of(context).push(
//                        MaterialPageRoute(builder: (_) {
//                          return DetailsModelingScreen(modeling: modelings[index], gardenName: 'jardin des espérides', publicVisibility: false);
//                        })
//                    );
//                    if (removedTodo != null) {
//                      Scaffold.of(context).showSnackBar(DeleteGardenSnackBar(
//                        key: ArchSampleKeys.snackbar,
//                        todo: modelings[index],
//                        onUndo: () => todosBloc.dispatch(AddTodo(todos[index])),
//                        localizations: localizations,
//                      ));
//                    }
                  },
                );
              },
            );
  }
}