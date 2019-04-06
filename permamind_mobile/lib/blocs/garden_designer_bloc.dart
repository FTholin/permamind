import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GardenDesignerBloc implements BlocBase {

  // List ici tous les items que l'on veut ajouter !
  Set<VegetableItem> _gardenVeggies = Set<VegetableItem>();

  // Stream to list of all possible items
  BehaviorSubject<List<VegetableItem>> _itemsController = BehaviorSubject<List<VegetableItem>>();
  Stream<List<VegetableItem>> get items => _itemsController;


  // Stream to list the items part of the shopping basket
  BehaviorSubject<List<VegetableItem>> _gardenVeggiesController = BehaviorSubject<List<VegetableItem>>(seedValue: <VegetableItem>[]);
  Stream<List<VegetableItem>> get gardenVeggies => _gardenVeggiesController;



  GardenDesignerBloc() {
    print("création GardenDesignerBloc");
    getAllPosts();
  }


  void addToGardenVeggies(VegetableItem item){
    _gardenVeggies.add(item);
    _postActionOnGarden();

    print("Ajout");
    print(_gardenVeggies);
  }

  void removeFromGardenVeggies(VegetableItem item){

    _gardenVeggies.remove(item);
    _postActionOnGarden();
    print("Suppression");
    print(_gardenVeggies);
  }

  void _postActionOnGarden(){

    // Feed the garden Veggies Controller  stream with the new content
    _gardenVeggiesController.sink.add(_gardenVeggies.toList());

    // any additional processing such as
    // computation of the total price of the basket
    // number of items, part of the basket...
  }


    List<VegetableItem> allPostsFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<VegetableItem>.from(jsonData.map((x) => VegetableItem.fromJson(x)));
  }


  void getAllPosts() async {
    final response = await http.get('http://109.238.10.82:5000/get/vegetable');

    print(response.body);
    _itemsController.sink.add(allPostsFromJson(response.body));
  }

  void dispose() {
    print("destruction GardensBloc");
    _itemsController?.close();
    _gardenVeggiesController?.close();
  }
}