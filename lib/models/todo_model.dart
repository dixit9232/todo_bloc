import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  @override
  List<Object?> get props => [id, task];

  final String id;
  final String task;

  const TodoModel({required this.id, required this.task});

  TodoModel copyWith({String? id, String? task}) {
    return TodoModel(id: id ?? this.id, task: task ?? this.task);
  }
}
