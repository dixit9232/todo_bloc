import 'package:equatable/equatable.dart';

import '../models/todo_model.dart';

class TodoState extends Equatable {
  final List<TodoModel> todoList;

  @override
  List<Object?> get props => [todoList];

  const TodoState({this.todoList = const []});

  TodoState copyWith({List<TodoModel>? todoList}) {
    return TodoState(todoList: todoList ?? this.todoList);
  }
}
