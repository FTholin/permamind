import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:permamind_mobile/models/vegetable_card.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';

/*
*
* This bloc component allows to get plants from the server.
*
* */
class VegetableBloc implements BlocBase {


  final _veggies = <VegetableCard>[];

  get veggies => _veggies;

  Future<Stream<VegetableCard>> getVegetables() async {
    final String url = 'https://api.punkapi.com/v2/beers';

    final client = new http.Client();
    final streamedRest = await client.send(
        http.Request('get', Uri.parse(url))
    );

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => VegetableCard.fromJSON(data));
  }

  VegetableBloc(){
    print("création VegetableBloc");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("destruction VegetableBloc");
  }
}
