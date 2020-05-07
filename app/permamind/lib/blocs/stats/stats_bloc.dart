//import 'dart:async';
//import 'package:meta/meta.dart';
//import 'package:bloc/bloc.dart';
//import 'package:Permamind/blocs/blocs.dart';
//
//class StatsBloc extends Bloc<StatsEvent, StatsState> {
//  final GardensBloc gardensBloc;
//  StreamSubscription gardensSubscription;
//
//  StatsBloc({@required this.gardensBloc}) {
//    gardensSubscription = gardensBloc.listen((state) {
//      if (state is GardensLoadSuccess) {
//        add(UpdateStats(state.gardens));
//      }
//    });
//  }
//
//
//  @override
//  StatsState get initialState => StatsLoading();
//
//  @override
//  Stream<StatsState> mapEventToState(StatsEvent event) async* {
//    if (event is UpdateStats) {
//      int numActive = 42;
//
//      int numCompleted = 42;
//
//      yield StatsLoaded(numActive, numCompleted);
//    }
//  }
//
//
//  @override
//  void dispose() {
//    gardensSubscription.cancel();
////    super.dispose();
//  }
