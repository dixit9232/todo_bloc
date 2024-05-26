import 'package:bloc/bloc.dart';
import 'package:todo_bloc/bloc/todo_event.dart';
import 'package:todo_bloc/bloc/todo_state.dart';
import 'package:todo_bloc/models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  List<TodoModel> todoList = [];

  TodoBloc(super.initialState) {
    on<AddTodo>(addTodo);
    on<RemoveTodo>(removeTodo);
  }

  void addTodo(AddTodo event, Emitter<TodoState> emit) {
    todoList.add(TodoModel(id: event.id, task: event.task));
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void removeTodo(RemoveTodo event, Emitter<TodoState> emit) {
    todoList.remove(event.todoObject);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
