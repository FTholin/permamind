import 'package:arch/arch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';

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
             items: AppTab.values.map((tab) {
               Image picture;
              Text text;
              switch (tab) {
                case AppTab.gardens:
                  picture = Image.asset(
                    "assets/bar_buttons_icons/garden.png",
                    semanticLabel: 'gardens icon bottom nav bar',
                    height: 35,
                    width: 37,
                  );
                  text = Text("${AppLocalizations.of(context).tabBarGarden}");
                  break;
                case AppTab.abc:
                  picture = Image.asset(
                    "assets/bar_buttons_icons/abc.png",
                    semanticLabel: 'abc icon bottom nav bar',
                    height: 35,
                    width: 37,
                  );
                  text = Text("ABC");
                  break;
                case AppTab.learning:
                  picture = Image.asset(
                    "assets/bar_buttons_icons/knowledge.png",
                    semanticLabel: 'learning icon bottom nav bar',
                    height: 35,
                    width: 37,
                  );
                  text = Text("${AppLocalizations.of(context).tabBarTutorials}");
                  break;
                case AppTab.profile:
                  picture = Image.asset(
                    "assets/bar_buttons_icons/profil.png",
                    semanticLabel: 'profile icon bottom nav bar',
                    height: 35,
                    width: 37,
                  );
                  text = Text("${AppLocalizations.of(context).tabBarProfile}");
                  break;
              }

              return BottomNavigationBarItem(
//            backgroundColor: Colors.green,
                  icon: picture,
                  title: text
              );
            }).toList(),
            currentIndex: AppTab.values.indexOf(activeTab),
            onTap: (index) => onTabSelected(AppTab.values[index]),
          );
        });
  }
}


//const <BottomNavigationBarItem>[
//BottomNavigationBarItem(
//icon: Icon(Icons.home),
//title: Text('Home'),
//),
//BottomNavigationBarItem(
//icon: Icon(Icons.business),
//title: Text('Business'),
//),
//BottomNavigationBarItem(
//icon: Icon(Icons.school),
//title: Text('School'),
//),
//],

//  return BlocBuilder<ThemeBloc, ThemeState>(
//        builder: (context, themeState) {
//          return BubbleBottomBar(
//              hasNotch: true,
//              opacity: .1,
//              currentIndex: AppTab.values.indexOf(activeTab),
//              onTap: (index) => onTabSelected(AppTab.values[index]),
//              borderRadius: BorderRadius.vertical(
//                  top: Radius.circular(
//                      10)),
//              //border radius doesn't work when the notch is enabled.
//              elevation: 8,
//
//              items: AppTab.values.map((tab) {
//                Image picture;
//                Text text;
//                switch (tab) {
//                  case AppTab.gardens:
//                    picture = Image.asset(
//                        "assets/bar_buttons_icons/garden.png",
//                        height: 40,
//                        width: 37,
//                        semanticLabel: 'garden icon bottom nav bar'
//                    );
//                    text = Text("Gardens");
//                    break;
//                  case AppTab.abc:
//                    picture = Image.asset(
//                        "assets/bar_buttons_icons/home.png",
//                        height: 40,
//                        width: 37,
//                        semanticLabel: 'plants abcédaire bottom nav bar'
//                    );
//                    text = Text("ABC");
//                    break;
//                  case AppTab.learning:
//                    picture = Image.asset(
//                        "assets/bar_buttons_icons/knowledge.png",
//                        height: 40,
//                        width: 37,
//                        semanticLabel: 'Learning icon bottom nav bar'
//                    );
//                    text = Text("Tutorials");
//                    break;
//                  case AppTab.profile:
//                    picture = Image.asset(
//                        "assets/bar_buttons_icons/profil.png",
//                        semanticLabel: 'profile icon bottom nav bar',
//                        height: 40,
//                      width: 37,
//                    );
//                    text = Text("Profile");
//                    break;
//                }
//
//                return BubbleBottomBarItem(
//                  backgroundColor: Colors.green,
//                  icon: picture,
//                  title: text
//                );
//              }).toList()
//          );
//        }
//    );
//  }