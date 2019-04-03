import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';

/*
*
* This bloc component allows to get plants from the server.
*
* */
class VegetableBloc implements BlocBase {


  final _veggies = <VegetableItem>[];

  get veggies => _veggies;


  Future<Stream<VegetableItem>> fetchVeggies() async {
    final String url = 'https://api.punkapi.com/v2/beers';

    final client = new http.Client();
    final streamedRest = await client.send(
        http.Request('get', Uri.parse(url))
    );

    if (streamedRest.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .expand((data) => (data as List))
          .map((data) => VegetableItem.fromJSON(data));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load veggies');
    }
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
