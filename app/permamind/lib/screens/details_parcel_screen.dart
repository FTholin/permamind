//Column(
//mainAxisSize: MainAxisSize.max,
//children: <Widget>[
//
//BlocBuilder<DesignBloc, DesignState>(
//builder: (context, state) {
//if (state is DesignLoaded) {
//if (state.designGarden.designs.isEmpty) {
//return Container(
//height: 230,
//child: Center(
//child: VeggiesDesignChart(80.0, 100.0, [])
//),
//);
//} else {
//return Container(
//height: 230,
//child: Center(
//child: VeggiesDesignChart(80.0, 100.0, state.designGarden.designs.first.positioning)
//),
//);
//}
//} else {
//return Container(
//height: 230,
//child: LoadingIndicator(),
//);
//}
//}
//),
//
//BlocBuilder<ActivitiesBloc, ActivitiesState>(
//builder: (context, state) {
//if (state is ActivitiesLoaded) {
//return SchedulerCalendar(
//referenceDate: DateTime.now(),
//schedule: state.schedule,
//);
//} else {
//return Expanded(
//child: Container(
//)
//);
//}
//}
//),
//const SizedBox(height: 8.0),
////          _buildButtons(),
//const SizedBox(height: 8.0),
//BlocBuilder<ActivitiesBloc, ActivitiesState>(
//builder: (context, state) {
//if (state is ActivitiesLoaded) {
//return Expanded(
//child: Container(
//child: _buildEventList(state.referenceDate, state.schedule)
//),
//);
//} else {
//return Expanded(
//child: Container(
//)
//);
//}
//}
//),
////          Expanded(child: _buildEventList()),
//],
//),



//floatingActionButton: ActivitySpeedDial(
//visible: true
//),