import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:riseup_sports_game/api_controller/api_keys.dart';
import 'package:riseup_sports_game/models/footballModel.dart';

class FootballApi extends ChangeNotifier {
  var jsonData;
  FootballMatchModel _footballMatchs;
  bool isComplete = false;

  FootballMatchModel get footballmatch => _footballMatchs;

  Future<void> fetch() async {
    print("hi football");
    try {
      print("hello football");
      http.Response response = await http.post(
        Uri.parse(ApiKeys.footballapi),
        headers: {"key": "Authorization"},
      );
      print("till okay football");
      jsonData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        print('Football: ${jsonData}');
        FootballMatchModel footballMatchModel =
            FootballMatchModel.fromJson(jsonData);
        print(footballMatchModel.status);
        _footballMatchs = footballMatchModel;
        print("football length: ${_footballMatchs.matches.length}");

        notifyListeners();

        isComplete = true;
        print(_footballMatchs.matches.length);
      } else {
        print("error football 1");
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("error football 2");
      throw Exception(e.toString());
    }
  }
}
