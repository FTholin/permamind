import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/models/vegetable_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:uuid/uuid.dart';


class GardenDesignerBloc implements BlocBase {

  // List ici tous les items que l'on veut ajouter !
  List<VegetableItem> _gardenVeggies = List<VegetableItem>();

  // Ce Stream nous permet de nourrir notre liste de légumes initiale
  BehaviorSubject<List<VegetableItem>> _itemsController = BehaviorSubject<List<VegetableItem>>();
  Stream<List<VegetableItem>> get items => _itemsController;


  // Stream to list the items part of the shopping basket
  BehaviorSubject<List<VegetableItem>> _gardenVeggiesController = BehaviorSubject<List<VegetableItem>>(seedValue: <VegetableItem>[]);
  Stream<List<VegetableItem>> get gardenVeggies => _gardenVeggiesController;

  // Variables to stores garden dimensions
  double _gardenHeightDimension  = 0.0, _gardenWidthDimension = 0.0;

  String _gardenSoilType;


  // TODO A terme faire un controller comme itemController pour remplir dynamiquement les types de sol


  GardenDesignerBloc() {
    print("création GardenDesignerBloc");
    getAllVeggies();
  }


  void alterGardenHeight(double value) {
    print("longueur modifiée");
    _gardenHeightDimension = value;
    print(_gardenHeightDimension);
  }

  void alterGardenWidth(double value) {
    print("largeur modifiée");
    _gardenWidthDimension = value;
    print(_gardenWidthDimension);
  }

  void alterGardenSoil(String value) {
    print("Type de sol modifié");
    _gardenSoilType = value;
    print(_gardenSoilType);
  }

  /*
  * This function add a new item in list of veggies with stream mechanism
  * */
  void addToGardenVeggies(VegetableItem item){
    _gardenVeggies.add(item);
    _postActionOnGarden();

    print("Ajout");

    for (var e in _gardenVeggies) {
      print(e.vegetableName);
    }

  }

  /*
  * This function remove a new item in list of veggies with stream mechanism
  * */
  void removeFromGardenVeggies(VegetableItem item){

    _gardenVeggies.remove(item);
    _postActionOnGarden();
    print("Suppression");
    for (var e in _gardenVeggies) {
      print(e.vegetableName);
    }

  }

  void _postActionOnGarden(){

    // Feed the garden Veggies Controller  stream with the new content
    _gardenVeggiesController.sink.add(_gardenVeggies.toList());

    // any additional processing such as
    // computation of the total price of the basket
    // number of items, part of the basket...
  }

  void sendModel() {

    // TODO Fonction qui check que tous les champs sont ok
    var veggiesQt = Map();

    _gardenVeggies.forEach((x) => veggiesQt[x.vegetableName] = !veggiesQt.containsKey(x.vegetableName) ? (1) : (veggiesQt[x.vegetableName] + 1));

    createGarden(dataToJsonFormat(veggiesQt));
  }


  void generateModel() {
    final response = askModelResolution();
    print(response);
  }



  String dataToJsonFormat(Map veggiesQt) {

    var jsonData = {};
    var vegetables = {};
    var elem = {};
    var mapCharacteristics = {};

    veggiesQt.forEach((element, value) {
      elem["plants"] = value;
      vegetables[element] = elem;
    });

    mapCharacteristics["sizeW"] = _gardenWidthDimension;
    mapCharacteristics["sizeH"] = _gardenHeightDimension;
    mapCharacteristics["soilType"] = _gardenSoilType;

    jsonData["name"] = "flo_123456789";
    jsonData["vegetables"] = vegetables;
    jsonData["map"] = mapCharacteristics;


    return json.encode(jsonData);
  }

  Future<http.Response> createGarden(String jsonData) async{

    // server distant
    final response = await http.post('http://109.238.10.82:5000/send/flo_123456789',
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader : ''
        },
        body: jsonData
    );
    return response;
  }


  Future<http.Response> askModelResolution() async{
    final response = await http.get('http://109.238.10.82:5000/generate/flo_123456789/50');
    return response;
  }

    List<VegetableItem> allPostsFromJson(String str) {
    final jsonData = json.decode(str);
    return new List<VegetableItem>.from(jsonData.map((x) => VegetableItem.fromJson(x)));
  }


  // TODO A terme cette fonction va être dans le bloc api
  void getAllVeggies() async {
    final response = await http.get('http://109.238.10.82:5000/get/vegetable');

    _itemsController.sink.add(allPostsFromJson(response.body));
  }

  void dispose() {
    print("destruction GardensBloc");
    _itemsController?.close();
    _gardenVeggiesController?.close();
  }
}