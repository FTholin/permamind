import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
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
          return BubbleBottomBar(
              hasNotch: true,
              opacity: .1,
              currentIndex: AppTab.values.indexOf(activeTab),
              onTap: (index) => onTabSelected(AppTab.values[index]),
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                      10)),
              //border radius doesn't work when the notch is enabled.
              elevation: 8,

              items: AppTab.values.map((tab) {
                SvgPicture svgPicture;
                Text text;
                switch (tab) {
                  case AppTab.gardens:
                    svgPicture = SvgPicture.asset(
                        "assets/bar_buttons_icons/garden.svg",
                        semanticsLabel: 'garden icon bottom nav bar'
                    );
                    text = Text("Gardens");
                    break;
                  case AppTab.abc:
                    svgPicture = SvgPicture.asset(
                        "assets/bar_buttons_icons/home.svg",
                        semanticsLabel: 'plants abcédaire bottom nav bar'
                    );
                    text = Text("ABC");
                    break;
                  case AppTab.learning:
                    svgPicture = SvgPicture.asset(
                        "assets/bar_buttons_icons/knowledge.svg",
                        semanticsLabel: 'Learning icon bottom nav bar'
                    );
                    text = Text("Tutorials");
                    break;
                  case AppTab.profile:
                    svgPicture = SvgPicture.asset(
                        "assets/bar_buttons_icons/profil.svg",
                        semanticsLabel: 'profile icon bottom nav bar'
                    );
                    text = Text("Profile");
                    break;
                }

                return BubbleBottomBarItem(
                  backgroundColor: Colors.green,
                  icon: svgPicture,
                  activeIcon: svgPicture,
                    title: text
                );
              }).toList()
          );
        }
    );
  }
}
