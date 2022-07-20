// To parse this JSON data, do
//
//     final scanModel = scanModelFromMap(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;

class ScanModel {
  ScanModel({
    this.id,
    this.type,
    required this.value,
  }) {
    if (value.contains('http')) {
      type = 'http';
    } else {
      type = 'geo';
    }
  }

  int? id;
  String? type;
  String value;

  LatLng getLatLng() {
    final latLng = value.substring(4).split(',');
    final parsedLat = double.parse(latLng[0]);
    final parsedLng = double.parse(latLng[2]);
    return LatLng(parsedLat, parsedLng);
  }

  factory ScanModel.fromJson(String str) => ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "value": value,
      };
}
