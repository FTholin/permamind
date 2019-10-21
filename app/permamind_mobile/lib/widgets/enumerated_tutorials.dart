import 'package:circular_check_box/circular_check_box.dart';
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
                    leading: CircularCheckBox(
                        value: true,
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                        onChanged: (bool x) {
                        }
                    ),
                    trailing: Icon(
                      Icons.chevron_right,
//                      semanticLabel: @'',
                    ),
                    onTap: () async {
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
                            return BlocProvider.value(
                              value: BlocProvider.of<TutorialsBloc>(context),
                              child: EnumeratedActivitiesScreen(tutorialName: tutorials[index].tutorialName,
                                  tutorialId: tutorials[index].tutorialId),
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

}

