import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/screen/p_menu.dart';
import 'package:memory_game/screen/p_result.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc() ,
      child: MaterialApp(
        title: 'Memory Game',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: const Color(0xFF1573AA),
            appBarTheme: const AppBarTheme(
              color: Color(0xFF142550) ,
            )
        ),
        home: const MenuScreen(),
      ),
    );
  }
}
