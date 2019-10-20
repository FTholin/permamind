
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';

class EnumeratedActivitiesScreen extends StatelessWidget {

  final String tutorialId;

  EnumeratedActivitiesScreen({this.tutorialId, Key key})
      : super(key: key ?? ArchSampleKeys.detailsGardenScreen);

  @override
  Widget build(BuildContext context) {
//    final tutorialsBloc = BlocProvider.of<TutorialsBloc>(context);

    return BlocBuilder<TutorialsBloc, TutorialsState>(
      builder: (context, state) {
        if (state is TutosLoading) {
          return Container(child: Text("TutosLoading"),);
        } else if (state is TutosLoaded) {
          final tutorials = state.tutorials;
          return Container(child: Text("TutosLoaded"),);
        } else {
          return Container(child: Text("Else statement"),);
        }
      },
    );
  }
}



