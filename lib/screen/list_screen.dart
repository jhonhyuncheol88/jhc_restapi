import 'package:flutter/material.dart';
import 'package:jhc_restapi/model/todo_model.dart';
import 'package:jhc_restapi/screen/detail_screen.dart';
import 'package:provider/provider.dart';

import '../vo/todo.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoMolel>(context, listen: false).setTodoListFromServer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          ' Todo 리스트 ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Consumer<TodoMolel>(builder: (context, todomodel, child) {
            return Column(
              children: todomodel.todoList
                  .map((td) => buildTodoBox(todo: td, ctx: context))
                  .toList(),
            );
          }),
        ),
      ),
    );
  }
}

Widget buildTodoBox({required Todo todo, required BuildContext ctx}) {
  TextStyle style1 =
      TextStyle(color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle style2 =
      TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle style3 =
      TextStyle(color: Colors.blue, fontSize: 15, fontWeight: FontWeight.bold);
  TextStyle style4 =
      TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold);

  return GestureDetector(
    onTap: () {
      Navigator.push(
        ctx,
        MaterialPageRoute(
            builder: (context) => DetailScreen(
                  id: todo.id,
                )),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 70,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                '#${todo.id}',
                style: style1,
              ),
              SizedBox(
                width: 14,
              ),
              Text(
                '#user${todo.id}',
                style: style1,
              )
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '${todo.title}',
                  style: style2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${todo.completed ? "완료" : "미완료"}',
                style: todo.completed ? style3 : style4,
              )
            ],
          ),
        ],
      ),
    ),
  );
}
