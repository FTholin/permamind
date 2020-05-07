import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Permamind/arch_bricks/arch_bricks.dart';
import 'package:Permamind/blocs/blocs.dart';


class JoinGardenScreen extends StatefulWidget {
  final bool isEditing;

  JoinGardenScreen({
    Key key,
    @required this.isEditing,
  }) : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _JoinGardenScreenState createState() => _JoinGardenScreenState();
}

class _JoinGardenScreenState extends State<JoinGardenScreen> {

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
          title: Text("Join one of our garden"),

        ),
        body: Center(
          child: Text("Map for join garden"),
        )
    );
  }
}