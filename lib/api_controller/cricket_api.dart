import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:riseup_sports_game/api_controller/api_keys.dart';
import 'package:riseup_sports_game/models/cricketMatchModel.dart';
import 'package:http/http.dart' as http;

class CricketApi extends ChangeNotifier {
  var jsonData;
  CrickeMatchModel _cricketMatches;

  bool isComplete = false;

  CrickeMatchModel get cricketMatches => _cricketMatches;

  Future<void> fetch() async {
    print("hi cricket1");
    try {
      print("hello cricket");
      http.Response response = await http.post(
        Uri.parse(ApiKeys.cricketapi),
        headers: {"key": "Accept", "value": "application/json", "type": "text"},
      );
      print("till okay cricket");
      // print(jsonData);
      jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print(jsonData);
        CrickeMatchModel cricketmatchData = CrickeMatchModel.fromJson(jsonData);
        print(cricketmatchData.status);
        _cricketMatches = cricketmatchData;
        print("cricket length: ${_cricketMatches.matches.length}");

        notifyListeners();

        isComplete = true;
        print(_cricketMatches.matches.length);
      } else {
        print("error cricket 1");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("error cricket 2");
      throw Exception(e.toString());
    }
  }
}
