import 'dart:convert';

import 'package:ApplicationName/swapresponsemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

var swapStatus;
// ignore: non_constant_identifier_names
Future<SwapStatus> Swapresposnedata() async {
  final response = await http.get(
    Uri.parse(
        'https://api.changenow.io/v1/transactions/2a12c1272928eb/a4643d07a4ae7c79183e95e53da2fa17c3f2307e901c1b440083b1f0c9a32cc5?api_key=a4643d07a4ae7c79183e95e53da2fa17c3f2307e901c1b440083b1f0c9a32cc5&'),
  );
  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    swapStatus = swapStatusFromJson(response.body);

    return swapStatus;
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
