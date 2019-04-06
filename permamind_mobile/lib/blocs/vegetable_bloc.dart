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


  Future<Stream<VegetableItem>> fetchVeggies() async {
    final String url = 'http://127.0.0.1:5000/get/vegetable';

    final client = new http.Client();
    final streamedRest = await client.send(
        http.Request('get', Uri.parse(url))
    );

    return streamedRest.stream
        .transform(utf8.decoder)
        .transform(json.decoder)
        .expand((data) => (data as List))
        .map((data) => VegetableItem.fromJSON(data));
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