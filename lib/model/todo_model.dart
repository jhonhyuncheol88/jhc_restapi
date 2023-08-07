import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jhc_restapi/vo/todo.dart';

class TodoMolel extends ChangeNotifier {
  Todo detailTodo = Todo();

  List<Todo> todoList = []; //  리스트 빌더

  void setTodoListFromServer() async {
    //서버에 데이터를 받아오는 코드
    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/'));

//데이터를 json 코드로
    var listMap = jsonDecode(response.body);

// json  인덱스를 연결
    for (int i = 0; i < listMap.length; i++) {
      var map = listMap[i];

      //map json 데이터를 Todo모델로 만들기

      Todo t = Todo.fromJson(map);

//ui 코드에 todolist에 t 라는 Todo모델을 넣기
      todoList.add(t);
    }

    notifyListeners();
  }

  void setTodoFromServer(int id) async {
    detailTodo = Todo();

    var response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
    print(response.body);
    var map = jsonDecode(response.body); // 데이터 분해

    detailTodo = Todo.fromJson(map);

    notifyListeners();
  }
}
