import 'package:flutter/material.dart';

class ParcelCarouselData{

  final String parcelName;
  final String parcelId;
  final String modelingName;
  final int dayActivitiesCount;

  ParcelCarouselData({
    @required this.parcelName,
    @required this.parcelId,
    @required this.modelingName,
    @required this.dayActivitiesCount
  });
}