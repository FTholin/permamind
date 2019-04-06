import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GardenDesignerBloc implements BlocBase {

  // List of all items, part of the shopping basket
  Set<VegetableItem> _gardenVeggies = Set<VegetableItem>();

  // Stream to list of all possible items
  BehaviorSubject<List<VegetableItem>> _itemsController = BehaviorSubject<List<VegetableItem>>();
  Stream<List<VegetableItem>> get items => _itemsController;


  // Stream to list the items part of the shopping basket
  BehaviorSubject<List<VegetableItem>> _gardenVeggiesController = BehaviorSubject<List<VegetableItem>>(seedValue: <VegetableItem>[]);
  Stream<List<VegetableItem>> get gardenVeggies => _gardenVeggiesController;



  GardenDesignerBloc() {
    print("création GardenDesignerBloc");
    listenForVeggies();
  }


  void addToGardenVeggies(VegetableItem item){
    _gardenVeggies.add(item);
    _postActionOnGarden();
  }

  void removeFromGardenVeggies(VegetableItem item){
    _gardenVeggies.remove(item);
    _postActionOnGarden();
  }

  void _postActionOnGarden(){
    // Feed the garden Veggies Controller  stream with the new content
    _gardenVeggiesController.sink.add(_gardenVeggies.toList());

    // any additional processing such as
    // computation of the total price of the basket
    // number of items, part of the basket...
  }

  //
  // Generates a series of Shopping Items
  // Normally this should come from a call to the server
  // but for this sample, we simply simulate
  //
  


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


    void listenForVeggies() async {
    final Stream<VegetableItem> stream = await fetchVeggies();
    print(stream);
    stream.listen((VegetableItem veg) => () =>  _itemsController.sink.add(veg as List<VegetableItem>)
    );
  }

  void dispose() {
    print("destruction GardensBloc");
    _itemsController?.close();
    _gardenVeggiesController?.close();
  }
}