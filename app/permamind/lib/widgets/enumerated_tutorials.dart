import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';

class EnumeratedTutorials extends StatelessWidget {
  EnumeratedTutorials({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return BlocBuilder<TutorialsBloc, TutorialsState>(
      builder: (context, state) {
        if (state is TutosLoading) {
          return Container(
            child: Text("TutosLoading"),
          );
        } else if (state is TutosLoaded) {
          final tutorials = state.tutorials;
          return Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Text(
                        'Welcome to Tutorials',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Georgia',
                          fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                    ),
                    Text(
                      'We believe the world is more interesting with some key concepts in pockets.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Georgia',
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                      child: ListView.builder(
                          itemCount: tutorials.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                title: Text('${tutorials[index].heading}'),
                                leading: CircularCheckBox(
                                    value: false,
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.padded,
                                    onChanged: (bool x) {}),
                                trailing: Icon(
                                  Icons.chevron_right,
//                      semanticLabel: @'',
                                ),
                                onTap: () async {
                                  await Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<TutorialsBloc>(
                                          context),
                                      child: EnumeratedActivitiesScreen(
                                          tutorialName:
                                              tutorials[index].heading,
                                          tutorialId: tutorials[index].id),
                                    );
                                  }));
                                },
                              ),
                            );
                          })))
            ],
          );
        } else {
          return Container();
        }
      },
    );
  }
}
