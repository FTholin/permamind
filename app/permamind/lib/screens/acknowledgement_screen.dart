import 'package:arch/arch.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permamind/models/acknowledgements_names.dart';


class AcknowledgementScreen extends StatefulWidget {


  @override
  _AcknowledgementScreenState createState() => _AcknowledgementScreenState();
}

class _AcknowledgementScreenState extends State<AcknowledgementScreen> {

  ThanksList thk;
  @override
  void initState() {
    thk = ThanksList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context).appSettingsThanks}"),
      ),
      body: Padding(
        padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Padding(
                  padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(
                                0xFF01534F),
                            width: 0.5),
                        borderRadius:
                        BorderRadius.all(
                            Radius.circular(
                                10)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(1 * SizeConfig.heightMultiplier),
                        child: Text("Tout est parti d'une petite graine, pourtant sans eau, sans soleil et sans l'écosystème qui la soutient celle-ci ne pourrait se développer. Merci à tous ceux qui nous soutiennent et nous ont soutenu...",
                            style: TextStyle(
                              color: const Color(0xFF01534F),
                              fontStyle: FontStyle.italic,
                              fontSize: 1.6 * SizeConfig.textMultiplier,
                            ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: thk.names.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${thk.names[index]}', style: TextStyle(
                      color: const Color(0xFF01534F),
                      fontSize: 2 * SizeConfig.textMultiplier,
                    ),),
                  );
                },
              )
            )
          ],
        )
      ),
    );
  }
}