import 'package:flutter/material.dart';

import 'package:jhc_restapi/model/todo_model.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  int id;
  DetailScreen({required this.id});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();

    // todo투두 데이터 가져오기a
    Provider.of<TodoMolel>(context, listen: false).setTodoFromServer(widget.id);
  }

  TextStyle titlestyle =
      TextStyle(color: Color(0xff999999), fontWeight: FontWeight.bold);
  TextStyle contentstyle =
      TextStyle(color: Colors.black87, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Todo 상세보기',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Consumer<TodoMolel>(
            builder: (context, todomodel, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'userId',
                    style: titlestyle,
                  ),
                  Text(
                    todomodel.detailTodo.userId.toString(),
                    style: contentstyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'id',
                    style: titlestyle,
                  ),
                  Text(
                    todomodel.detailTodo.id.toString(),
                    style: contentstyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'title',
                    style: titlestyle,
                  ),
                  Text(
                    todomodel.detailTodo.title,
                    style: contentstyle,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'completed',
                    style: titlestyle,
                  ),
                  Text(
                    todomodel.detailTodo.completed.toString(),
                    style: contentstyle,
                  ),
                ],
              );
            },
          )),
    );
  }
}
