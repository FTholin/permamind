import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:permamind_mobile/arch_bricks/flutter_todos_keys.dart';
import 'package:todos_repository/todos_repository.dart';

class FilteredModellings extends StatelessWidget {
  final List<Modelling> modellings;
  final String gardenName;
  final bool gardenPublicVisibility;

  FilteredModellings({this.modellings, this.gardenName, this.gardenPublicVisibility, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final todosBloc = BlocProvider.of<TodosBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    return GridView.builder(
              key: ArchSampleKeys.todoList,
              itemCount: modellings.length,

              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4) ),

              itemBuilder: (BuildContext context, int index) {
                return InkResponse(
                  enableFeedback: true,
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                         ListTile(
                          leading: Icon(Icons.ac_unit, size: 50),
                          title: Text('${modellings[index].modellingName}'),
                          subtitle: Text('${modellings[index].modellingId}'),
                        ),
                      ],
                    ),
                  ),
                  onTap: () async {

                      // TODO retrieve all form infos and transfer them
                    
                    final todo = await Navigator.pushNamed(context,
                      ArchSampleRoutes.detailsModelling,
                      arguments: DetailsModellingsScreenArguments(
                          modelling: modellings[index],
                          gardenName: 'jardin des espérides',
                          gardenPublicVisibility: false
                      ),
                    );
//
//                    final removedTodo = await Navigator.of(context).push(
//                        MaterialPageRoute(builder: (_) {
//                          return DetailsModellingScreen(modelling: modellings[index], gardenName: 'jardin des espérides', gardenPublicVisibility: false);
//                        })
//                    );
//                    if (removedTodo != null) {
//                      Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
//                        key: ArchSampleKeys.snackbar,
//                        todo: modellings[index],
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