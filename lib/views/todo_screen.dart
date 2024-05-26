import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_bloc.dart';
import 'package:todo_bloc/bloc/todo_event.dart';
import 'package:todo_bloc/models/todo_model.dart';

import '../bloc/todo_state.dart';
import '../utils/print_function.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          cp("length ${state.todoList.length}");
          if (state.todoList.isEmpty) {
            return const Center(
                child: Text(
              "No To do found",
              style: TextStyle(fontSize: 20),
            ));
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                final todoData = state.todoList[index];
                return ListTile(
                  title: Text("${todoData.task} ${index + 1}"),
                  trailing: IconButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(RemoveTodo(todoObject: TodoModel(id: todoData.id, task: todoData.task)));
                      },
                      icon: const Icon(Icons.delete)),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          String id = DateTime.now().microsecondsSinceEpoch.toString();
          String task = "Task";
          context.read<TodoBloc>().add(AddTodo(id: id, task: task));
        },
        label: const Text(
          "Add To Do",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
