import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/bloc/todo_state.dart';
import 'package:todo_bloc/views/todo_screen.dart';

import 'bloc/todo_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(const TodoState()),
      child: MaterialApp(
        themeMode: ThemeMode.dark,
        title: 'Flutter Demo',
        theme: ThemeData.dark(

          useMaterial3: true,
        ),
        home: const TodoScreen(),
      ),
    );
  }
}
