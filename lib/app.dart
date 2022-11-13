import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/view/menu/screen/menu_screen.dart';

import 'bloc/game_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
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