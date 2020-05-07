//import 'package:flutter/material.dart';
//import 'package:flutter/foundation.dart';
//import 'package:flutter/widgets.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:Permamind/arch_bricks/arch_bricks.dart';
//import 'package:Permamind/blocs/stats/stats.dart';
//import 'package:Permamind/widgets/widgets.dart';
//import 'package:Permamind/arch_bricks/flutter_todos_keys.dart';
//
//
//class Stats extends StatelessWidget {
//  Stats({Key key}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return BlocBuilder<StatsBloc, StatsState>(
//      builder: (context, state) {
//        if (state is StatsLoading) {
//          return LoadingIndicator(key: FlutterTodosKeys.statsLoadingIndicator);
//        } else if (state is StatsLoaded) {
//          return Center(
//            child: Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                Padding(
//                  padding: EdgeInsets.only(bottom: 8.0),
//                  child: Text(
//                    ArchSampleLocalizations.of(context).completedTodos,
//                    style: Theme.of(context).textTheme.title,
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(bottom: 24.0),
//                  child: Text(
//                    '${state.numCompleted}',
//                    key: ArchSampleKeys.statsNumCompleted,
//                    style: Theme.of(context).textTheme.subhead,
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(bottom: 8.0),
//                  child: Text(
//                    ArchSampleLocalizations.of(context).activeTodos,
//                    style: Theme.of(context).textTheme.title,
//                  ),
//                ),
//                Padding(
//                  padding: EdgeInsets.only(bottom: 24.0),
//                  child: Text(
//                    "${state.numActive}",
//                    key: ArchSampleKeys.statsNumActive,
//                    style: Theme.of(context).textTheme.subhead,
//                  ),
//                )
//              ],
//            ),
//          );
//        } else {
//          return Container(key: FlutterTodosKeys.emptyStatsContainer);
//        }
//      },
//    );
//  }
