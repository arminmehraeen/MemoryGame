import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/screen/p_game.dart';
import 'package:memory_game/screen/p_menu.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GameBloc, GameState>(builder: (context, state) {
        if (state is GameFinished) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Result ${ state.result.toString() }"),
                const Divider() ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () => context
                        .read<GameBloc>()
                        .add(GameRestart(isRestart: true)), child: const Icon(Icons.refresh)) ,
                    const SizedBox(width: 10,) ,
                    ElevatedButton(
                        onPressed: () => context
            .read<GameBloc>()
            .add(GameRestart(isRestart: false)), child: const Icon(Icons.home)) ,
                  ],
                )
              ],
            ),
          );
        }
        return Container() ;
      }, listener: (context, state) {
        if (state is Game) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => GameScreen(),
              ));
        }

        if(state is GameInitial) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MenuScreen(),
              ));
        }
      },) ,
    );

  }
}
