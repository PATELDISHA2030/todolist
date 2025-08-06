
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../json/model.dart';
class Tcontroller extends GetxController{

  var TodoList = RxList<model_data>();

  @override
  void onInit() {

    super.onInit();
    getTodo();
  }

//get method
  Future<RxList<model_data>> getTodo() async {
    TodoList.clear();
    final response = await http.get(
        Uri.parse("https://6855442e6a6ef0ed6631e6b6.mockapi.io/TODOLIST"));

    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      print("done");
      for (Map<String, dynamic> index in data) {
        TodoList.add(model_data.fromJson(index));
      }
      return TodoList;
    }
    else {
      return TodoList;
    }
  }
// post method

    Future<void>  postTodo(title,dec,number) async {
      final response = await http.post(
          Uri.parse("https://6855442e6a6ef0ed6631e6b6.mockapi.io/TODOLIST"),
         headers: { 'content-type': 'application/json'},
          body: jsonEncode({
            "title":title,
            "dec":dec,
            "number":number
          })




      );

      if (response.statusCode == 201) {
        print("done");
        TodoList.clear();
        getTodo();

      }
      else {
        print("error");
      }


    }
   // deletetodo

  Future<void>  deleteTodo(id) async {
    final response = await http.delete(
        Uri.parse("https://6855442e6a6ef0ed6631e6b6.mockapi.io/TODOLIST/$id"));
    if (response.statusCode == 200) {
      print("done");

      getTodo();

    }
    else {
      print("error");
    }


  }
  TextEditingController name = TextEditingController();
  var printText = ''.obs;

  void updateName() {
    printText.value = name.text;
    Get.back(); // Close dialog
  }

  @override
  void onClose() {
    name.dispose();
    super.onClose();
  }





}
