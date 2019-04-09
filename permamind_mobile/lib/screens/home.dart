// Import blocs modules
import 'package:permamind_mobile/blocs/bloc_provider.dart';
// Import widgets to embed them
import 'package:permamind_mobile/screens/gardens_page.dart';
import 'package:permamind_mobile/widgets/vegetables_panorama.dart';
import 'package:permamind_mobile/widgets/others.dart';

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  // Create a tab controller
  TabController controller;

  @override
  void initState() {
    super.initState();

    // Initialize the Tab Controller
    controller = new TabController(length: 3, vsync: this);

  }

  @override
  void dispose() {
    // Dispose of the Tab Controller
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      tabs: <Tab>[
        new Tab(
          // set icon to the tab
          icon: new Icon(Icons.terrain),
        ),
        new Tab(
          icon: new Icon(Icons.local_florist),
        ),
        new Tab(
          icon: new Icon(Icons.more_horiz),
        ),
      ],
      // setup the controller
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      // Add tabs as widgets
      children: tabs,
      // set the controller
      controller: controller,
    );
  }

  /*
   *------- Setup the page by setting up tabs in the body ------------------*
   */
  @override
  Widget build(BuildContext context) {
    // On récupère le bloc ici
    return new Scaffold(
      // Appbar
        appBar: new AppBar(
          // Title
            title: new Text("Permamind"),
            // Set the background color of the App Bar
            backgroundColor: Colors.green,
            // Set the bottom property of the Appbar to include a Tab Bar
            bottom: getTabBar()),
            // Set the TabBar view as the body of the Scaffold
            body:  getTabBarView(<Widget>[
                GardensPage(),
                VegetablesPanorama(),
                OthersPage(),
              ])
    );
  }
}