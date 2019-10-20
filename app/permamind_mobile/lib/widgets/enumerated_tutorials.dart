import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/screens/screens.dart';


class EnumeratedTutorials extends StatelessWidget {
  EnumeratedTutorials({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return BlocBuilder<TutorialsBloc, TutorialsState>(
      builder: (context, state) {
        if (state is TutosLoading) {
          return Container(child: Text("TutosLoading"),);
        } else if (state is TutosLoaded) {
          final tutorials = state.tutorials;

          return ListView.builder(
              itemCount: tutorials.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text('${tutorials[index].tutorialName}'),
                    trailing: Icon(
                      Icons.chevron_right,
//                      semanticLabel: @'',
                    ),
                    onTap: () async {
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<TutorialsBloc>(context),
                              child: EnumeratedActivitiesScreen(tutorialId: tutorials[index].tutorialId),
                            );
                          })
                      );
                    },
                  ),
                );
              }
          );
        } else {
          return Container(child: Text("Else statement"),);
        }
      },
    );
  }
//    return BlocBuilder<TutorialBloc, TutorialState>(
//        builder: (context, state) {
//          if (state is FilteredGardensLoading) {
//            // TODO ArchSampleKeys
//            return LoadingIndicator(key: ArchSampleKeys.todosLoading);
//          } else if (state is FilteredGardensLoaded) {
//            final gardens = state.filteredGardens;
//
//            return GridView.builder(
//              key: ArchSampleKeys.todoList,
//              itemCount: gardens.length,
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                  crossAxisCount: 2),
//              itemBuilder: (BuildContext context, int index) {
//                return InkResponse(
//                  enableFeedback: true,
//                  child: Container(
//                    padding: EdgeInsets.all(20.0),
//                    child: Center(
//                      child: GridTile(
//                        footer: Text(
//                          '${gardens[index].gardenName}',
//                          textAlign: TextAlign.center,
//                        ),
//                        child: Icon(Icons.local_florist,
//                            size: 40.0, color: Colors.white30),
//                      ),
//                    ),
//                    color: Colors.blue[400],
//                    margin: EdgeInsets.all(10.0),
//                  ),
//                  onTap: () async {
//                    final removedTodo = await Navigator.of(context).push(
//                        MaterialPageRoute(builder: (_) {
//                          return DetailsGardenScreen(garden: gardens[index]);
//                        })
//                    );
//                    if (removedTodo != null) {
//                      Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
//                        key: ArchSampleKeys.snackbar,
//                        garden: gardens[index],
////                        onUndo: () => gardensBloc.dispatch(AddGarden(gardens[index])),
//                        localizations: localizations,
//                      ));
//                    }
//                  },
//                );
//
//              },
//            );
//
//          }
//          else {
//            // TODO FlutterTodosKeys
//            return Container(key: FlutterTodosKeys.filteredTodosEmptyContainer);
//          }
//        }
//    );

}