import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/screen/p_game.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBloc, GameState>(
      listener: (context, state) {
        if (state is Game) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GameScreen(),
              ));
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Memory Game" , style: TextStyle(
                fontWeight: FontWeight.bold
              ),) ,

              ElevatedButton(onPressed: () => context.read<GameBloc>().add(GameStart()) , child: const Icon(Icons.play_arrow)) ,
            ],
          ),
        ),
      ),
    );
  }
}
