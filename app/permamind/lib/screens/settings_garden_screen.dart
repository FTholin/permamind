
import 'package:flutter/material.dart';

class SettingsGardenScreen extends StatelessWidget {

  SettingsGardenScreen({Key key})
      : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Code'),
      ),
      body: Center(
          child: Text('Garden Settings')
      ),
    );
  }
}