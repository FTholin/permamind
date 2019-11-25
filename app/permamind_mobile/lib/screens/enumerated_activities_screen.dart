import 'package:circular_check_box/circular_check_box.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/models/models.dart';

class EnumeratedActivitiesScreen extends StatelessWidget {
  final String tutorialId;
  final String tutorialName;

  EnumeratedActivitiesScreen(
      {@required this.tutorialName, @required this.tutorialId, Key key})
      : super(key: key ?? ArchSampleKeys.detailsGardenScreen);

  @override
  Widget build(BuildContext context) {
    final tutorialsBloc = BlocProvider.of<TutorialsBloc>(context);

    tutorialsBloc.add(LoadActivities(tutorialId));

    return BlocBuilder<TutorialsBloc, TutorialsState>(
      builder: (context, state) {
        if (state is ActivitiesLoading) {
          return Container(
            child: Text("ActivitiesLoading"),
          );
        } else if (state is ActivitiesLoaded) {
          final activities = state.activities;
          return Scaffold(
              appBar: AppBar(
                  title: Text("${tutorialName}"),
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        tutorialsBloc.add(LoadTutos());
                        Navigator.pop(context, false);
                      })),
              body: ActivitiesPanel(activities));
        } else {
          return Container();
        }
      },
    );
  }
}

class ActivitiesPanel extends StatefulWidget {
  List<Item> _data = new List<Item>();

  ActivitiesPanel(List<TutorialActivity> activities) {
    generateItems(activities);
  }

  @override
  _ActivitiesPanelState createState() => _ActivitiesPanelState();

  void generateItems(List<TutorialActivity> activities) {
    for (var item in activities) {
      _data.add(new Item(
        id: item.id,
        headerValue: '${item.heading}',
        expandedValue: '${item.content}'
      ));
    }
  }
}

class _ActivitiesPanelState extends State<ActivitiesPanel> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }


  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          widget._data[index].isExpanded = !isExpanded;
        });
      },
      children: widget._data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
          value: item.id,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
                title: Text(item.headerValue),
                leading: CircularCheckBox(
                    value: item.isChecked,
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    onChanged: null));
          },
          body: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  '${item.expandedValue}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    fontSize: 18,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.star, color: Colors.green[500]),
                    Icon(Icons.star, color: Colors.green[500]),
                    Icon(Icons.star, color: Colors.green[500]),
                    Icon(Icons.star, color: Colors.black),
                    Icon(Icons.star, color: Colors.black),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Icon(Icons.timer, color: Colors.green[500]),
                          Text('Duration:'),
                          Text('25 min'),
                        ],
                      ),
                    ],
                  ),
                ),
                ButtonTheme.bar(
                  child: ButtonBar(
                    children: <Widget>[
//                      FlatButton(
//                        child: const Text('Cancel'),
//                        onPressed: () {
//                          /* ... */
//                        },
//                      ),
                      FlatButton(
                        child: const Text('Done'),
                        onPressed: () {
                          item.isChecked = true;
                          item.isExpanded = false;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
