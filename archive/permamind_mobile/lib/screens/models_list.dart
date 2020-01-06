import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/garden_chart.dart';
import 'package:permamind_mobile/blocs/garden_designer_bloc.dart';


class ModelsListPage extends StatelessWidget {

  final GardenDesignerBloc bloc;

  ModelsListPage({
    Key key,
    this.bloc,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Choisis une configuration"),
      ),
      body: Center(
        child: StreamBuilder<List<Map<String, dynamic>>>(
          stream: bloc.configurations,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return new Container(
                  padding: EdgeInsets.all(80.0),
                  child:CircularProgressIndicator()
              );
            }
            else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Center(
                      child: GardenChartWidget(
                            dataJson: snapshot.data[index],
                            // Ce truc de ratio est à changer en fonction de la taille du jardin à voir
                            ratio: (MediaQuery.of(context).size.height / 2.0 ) * 74.7 / (MediaQuery.of(context).size.height / 2.0 )
                        )
                    ),
                  );
                },
              );
            }

          },
        )


      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}