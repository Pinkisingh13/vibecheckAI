import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier {
  final TextEditingController textController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String result = "";

  Future<String> vibeCheck(String text) async {
    try {
      isLoading = true;
      notifyListeners();
      debugPrint("Body text: $text");
      final response = await http.post(
        Uri.parse("https://vibecheckai-1jpr.onrender.com/vibecheck"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"text": text}),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        debugPrint(data.toString());
        result = data['message'];
        isLoading = false;
        notifyListeners();
        return result;
      } else {
        result = "Error: ${response.statusCode} ${response.reasonPhrase}";
        isLoading = false;
        notifyListeners();
        return result;
      }
    } catch (e) {
      result = "Error: $e";
      isLoading = false;
      notifyListeners();
      return result;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
