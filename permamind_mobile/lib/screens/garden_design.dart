import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/garden_dimensions.dart';
import 'package:permamind_mobile/widgets/garden_soil_list.dart';
import 'package:permamind_mobile/widgets/vegetable_selection.dart';
import 'package:permamind_mobile/widgets/garden_generator.dart';

// Import blocs modules
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/gardens_bloc.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';

class GardenDesigner extends StatefulWidget {
  @override
  GardenDesignerState createState() => new GardenDesignerState();
}

class GardenDesignerState extends State<GardenDesigner> {

  GardenDesignerBloc _gardenDesignerBloc;

  int current_step = 0;
  List<Step> my_steps;

  @override
  void initState() {
    super.initState();
    _gardenDesignerBloc = GardenDesignerBloc();

    // init the step to 0th position
    current_step = 0;
    my_steps = [
      new Step(
        // Title of the Step
        title: new Text("Dimensions du jardin"),
        content: new GardenDimensions(bloc: _gardenDesignerBloc),
        isActive: true

      ),
      new Step(
          title: new Text("Type de sol"),
          content: Container(
            height: 100,
            width: 250,
            child: new GardenSoilList(bloc: _gardenDesignerBloc),

          ),
          isActive: true
      ),
      new Step(
          title: new Text("Choisis tes légumes"),
          content: Container(
              height: 350,
              width: 310,
              child: VeggiesSelectionPage(bloc: _gardenDesignerBloc)
          ),
          isActive: true
      ),
      new Step(
          title: new Text("Génération de ton jardin"),
          content: Container(
              height: 350,
              width: 310,
              child: GardenGenerator(bloc: _gardenDesignerBloc)
    ),
          isActive: true
      )
    ];
  }

  @override
  void dispose() {
    _gardenDesignerBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      // Appbar
      appBar: new AppBar(
        // Title
        title: new Text("Créer ton jardin"),
      ),
      // Body
      body: new Container(
          child: new Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) =>
                Container(),
            currentStep: this.current_step,
            // List the steps you would like to have
            steps: my_steps,
            type: StepperType.vertical,
            // Know the step that is tapped
            onStepTapped: (step) {
              // On hitting step itself, change the state and jump to that step
              setState(() {
                // update the variable handling the current step value
                // jump to the tapped step
                current_step = step;
              });
              // Log function call
            },
          )),
    );
  }

}