import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/models/models.dart';

class TabSelector extends StatelessWidget {
  final AppTab activeTab;
  final Function(AppTab) onTabSelected;

  TabSelector({
    Key key,
    @required this.activeTab,
    @required this.onTabSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      key: ArchSampleKeys.tabs,
      currentIndex: AppTab.values.indexOf(activeTab),
      onTap: (index) => onTabSelected(AppTab.values[index]),

      items: AppTab.values.map((tab) {
        Icon icon;
        Text text;
        switch (tab) {
          case AppTab.gardens:
            icon = Icon(Icons.list, key: ArchSampleKeys.gardenTab);
            text = Text(ArchSampleLocalizations.of(context).gardens);
            break;
          case AppTab.abc:
            icon = Icon(Icons.import_contacts, key: ArchSampleKeys.abcTab);
            text = Text(ArchSampleLocalizations.of(context).abc);
            break;
          case AppTab.learning:
            icon = Icon(Icons.school, key: ArchSampleKeys.learningTab);
            text = Text(ArchSampleLocalizations.of(context).learning);
            break;
          case AppTab.settings:
            icon = Icon(Icons.settings, key: ArchSampleKeys.settingsTab);
            text = Text(ArchSampleLocalizations.of(context).settings);
            break;
        }
        return BottomNavigationBarItem(
          icon: icon,
          title: text,
        );
      }).toList(),
    );
  }
}