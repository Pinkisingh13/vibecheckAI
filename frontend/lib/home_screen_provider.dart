import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeScreenProvider extends ChangeNotifier {
  bool isLoading = false;
  String result = "";

  Future<String> vibeCheck(String text) async {

    try {
      isLoading = true;
    notifyListeners();
    final response = await http.post(
      Uri.parse("http://localhost:8000/vibecheck"),
      body: {
        "text": text,
      },
    );
    if(response.statusCode == 200){
      result = response.body;
      isLoading = false;
      notifyListeners();
      return result;
    }else{
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
   
    }finally{
      isLoading = false;
      notifyListeners();
    }
    
  }


}