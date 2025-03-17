import 'dart:convert';
import 'package:flutter/services.dart';



Future<Map<String, String>> LoadCountries() async {
  final String response = await rootBundle.loadString('assets/Countries.json');
  final data = Map<String, String>.from(jsonDecode(response));

  return data.map((Key, value) => MapEntry(Key, value));
}
