
import 'package:flutter/material.dart';

typedef AddParcelCallback = Function(String task, String note);

class AddParcelScreen extends StatefulWidget {
  final bool isEditing;
  final AddParcelCallback onSave;

  AddParcelScreen({
    Key key,
    @required this.onSave,
    @required this.isEditing,
  }) : super(key: key);

  @override
  _AddParcelScreenState createState() => _AddParcelScreenState();
}

class _AddParcelScreenState extends State<AddParcelScreen> {

//  final TextEditingController _activityNameController = TextEditingController();

  int _currentStep = 0;
  int _radioValue1 = 1;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Créer une parcelle de culture')),
      body: new Stepper(
        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepTapped: (int step) => setState(() => _currentStep = step),
        controlsBuilder: _createEventControlBuilder,
        onStepContinue:
        _currentStep < 3 ? () => setState(() => _currentStep += 1) : null,
        onStepCancel:
        _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
        steps: <Step>[
          new Step(
            title: new Text(''),
            content: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 30),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Quel est le nom de votre parcelle ?',
//                    textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 19),
                            )),
                        Container()
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: TextField(
                        decoration: InputDecoration(
//                        border: InputBorder.none,
                          hintText: 'Nom parcelle',
                        ),
                      ),
                    )
                  ],
                )),
            isActive: _currentStep >= 0,
            state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
          ),
          new Step(
            title: new Text(''),
            content: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  Text(
                    'Souhaitez vous rendre ce potager public ?',
                    textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 19),
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: null,
                      ),
                      Text(
                        'Oui',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: null,
                      ),
                      Text(
                        'Non',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            isActive: _currentStep >= 0,
            state:
            _currentStep >= 1 ? StepState.complete : StepState.disabled,
          ),
          new Step(
            title: new Text(''),
            content: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Ajouter quelques jardiniers ?',
                          textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 19),
                        ),
                      ),
                      Container()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          '(optionnel)',
                          textAlign: TextAlign.left,
//                        overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Container()
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      decoration: InputDecoration(
//                        border: InputBorder.none,
                        hintText: 'Jardiniers',
                      ),
                    ),
                  )
                ],
              ),
            ),
            isActive: _currentStep >= 0,
            state:
            _currentStep >= 2 ? StepState.complete : StepState.disabled,
          ),
          new Step(
            title: new Text(''),
            content: new Text('This is the third step.'),
            isActive: _currentStep >= 0,
            state:
            _currentStep >= 3 ? StepState.complete : StepState.disabled,
          ),
        ],
      ),
    );
  }
}

Widget _createEventControlBuilder(BuildContext context,
    {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
  return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        RaisedButton(onPressed: onStepCancel, child: const Text('BACK')),
        RaisedButton(onPressed: onStepContinue, child: const Text('CONTINUE'))
      ]);
}