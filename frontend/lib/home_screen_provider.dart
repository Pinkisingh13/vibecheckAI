import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading = false;
  String result = "";

  Future<String> vibeCheck(String text) async {
    try {
      isLoading = true;
      notifyListeners();
      print("Body text: $text");
      final response = await http.post(
        Uri.parse("http://192.168.1.7:8000/vibecheck"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"text": text}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        
        print(data);
        result = data['message'];
        isLoading = false;
        notifyListeners();
        return result;
      } else {
        result = "Something went wrong";
        isLoading = false;
        notifyListeners();
        return result;
      }
    } catch (e) {
      result = "Something went wrong";
      isLoading = false;
      notifyListeners();
      return result;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
