import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/models/models.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    return BlocBuilder<ThemeBloc, ThemeState>(
    builder: (context, themeState) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        key: ArchSampleKeys.tabs,
        currentIndex: AppTab.values.indexOf(activeTab),
        onTap: (index) => onTabSelected(AppTab.values[index]),
        items: AppTab.values.map((tab) {
          SvgPicture svgPicture;
          Text text;
          switch (tab) {
            case AppTab.gardens:
              svgPicture = SvgPicture.asset(
                  "assets/bar_buttons_icons/garden.svg",
                  semanticsLabel: 'garden icon bottom nav bar'
              );
              text = Text(ArchSampleLocalizations.of(context).gardens);
              break;
            case AppTab.abc:
              svgPicture = SvgPicture.asset(
                  "assets/bar_buttons_icons/home.svg",
                  semanticsLabel: 'plants abcédaire bottom nav bar'
              );
              text = Text(ArchSampleLocalizations.of(context).abc);
              break;
            case AppTab.learning:
              svgPicture = SvgPicture.asset(
                  "assets/bar_buttons_icons/knowledge.svg",
                  semanticsLabel: 'Learning icon bottom nav bar'
              );
              text = Text(ArchSampleLocalizations.of(context).learning);
              break;
            case AppTab.settings:
              svgPicture = SvgPicture.asset(
                  "assets/bar_buttons_icons/profil.svg",
                  semanticsLabel: 'profile icon bottom nav bar'
              );
              text = Text(ArchSampleLocalizations.of(context).settings);
              break;
          }
          return BottomNavigationBarItem(
            icon: svgPicture,
            title: text,
          );
        }).toList(),
      );
    }
    );
  }
}