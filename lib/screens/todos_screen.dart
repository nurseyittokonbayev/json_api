import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_api/api/api.dart';
import 'package:json_api/models/models.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<Todos> todos = [];
  final dio = Dio();

  void fetchTodos() async {
    try {
      final res = await dio.get('${ApiConst.baseUrl}/todos');
      if (res.statusCode == 200 || res.statusCode == 201) {
        final data = res.data as List<dynamic>;

        List<Todos> fetchedTodos = data.map((todos) {
          return Todos(title: todos['title'], completed: todos['completed']);
        }).toList();

        setState(() {
          todos = fetchedTodos;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    fetchTodos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: todos.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  title: Text(todo.title),
                  leading: todo.completed
                      ? const Icon(
                          Icons.done,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                );
              }),
    );
  }
}
