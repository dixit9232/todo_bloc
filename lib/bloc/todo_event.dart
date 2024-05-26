import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];

  const TodoEvent();
}

class AddTodo extends TodoEvent {
  final String id;

  final String task;

  const AddTodo({required this.id, required this.task});

  @override
  List<Object?> get props => [id, task];
}

class RemoveTodo extends TodoEvent {
  final Object todoObject;

  const RemoveTodo({required this.todoObject});

  @override
  List<Object?> get props => [todoObject];
}
