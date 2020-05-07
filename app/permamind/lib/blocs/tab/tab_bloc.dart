import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:Permamind/blocs/blocs.dart';
import 'package:Permamind/models/models.dart';


class TabBloc extends Bloc<TabEvent, AppTab> {
  @override
  AppTab get initialState => AppTab.gardens;

  @override
  Stream<AppTab> mapEventToState(TabEvent event) async* {
    if (event is UpdateTab) {
      yield event.tab;
    }
  }

}
