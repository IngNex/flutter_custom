import 'dart:convert';
import 'package:flutter_custom_design/domain/model/animals.model.dart';
import 'package:flutter/services.dart' as rootBundle;

Future<List<Animals>> loadAnimalsData() async {
  final jsonString =
      await rootBundle.rootBundle.loadString('json/animals.json');
  final List<dynamic> jsonResponse = json.decode(jsonString);
  final List<Animals> result =
      jsonResponse.map((data) => Animals.fromJson(data)).toList();
  return result;
}
