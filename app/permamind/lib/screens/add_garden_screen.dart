import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/screens.dart';


class AddGardenScreen extends StatefulWidget {

  final User _user;
  final DataRepository _dataRepository;

  AddGardenScreen({Key key,@required User user, @required DataRepository dataRepository})
      : assert(user != null),
        assert(dataRepository != null),
        _user = user,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  _AddGardenScreenState createState() => _AddGardenScreenState();
}

class _AddGardenScreenState extends State<AddGardenScreen> {

//  final TextEditingController _activityNameController = TextEditingController();

  int _currentStep = 0;
  int _radioValue1 = 1;


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
            content: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: <Widget>[
                  RaisedButton(onPressed: () async {

                    // TODO Connecter cette liste à la liste d'ajout des members
                    List<GardenMember> members = List<GardenMember>();

                  members.add(GardenMember(id: widget._user.id, pseudo: widget._user.pseudo));

                    final Garden garden = Garden("Jardin test", false,  widget._user.id, members, DateTime.now(), 0);

//                    BlocProvider.of<GardensBloc>(context).add(AddGardenDesign(await firebaseRepository.fetchIdGardenCreated(gardenName), designs));



                    // AJout du bloc dans la base
                   BlocProvider.of<GardensBloc>(context).add(
                       AddGarden(
                        Garden("Jardin test", false,  widget._user.id, members, DateTime.now(), 0)
                      ));


                    Navigator.pushNamedAndRemoveUntil(context, ArchSampleRoutes.home, (_) => false);

                  }, child: const Text('Finaliser jardin')),

                ],
              ),
            ),
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