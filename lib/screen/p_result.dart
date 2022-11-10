import 'package:circle_button/circle_button.dart';
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
          return Column(
            children: [
              Expanded(flex: 4,child: Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      state.result ?
                      Column(
                        children:  [
                          Text(
                            "You Won",
                            style: TextStyle(fontWeight: FontWeight.bold ,
                                color: Theme.of(context).primaryColor , fontSize: 30),
                          ),
                          Text(
                            "Your work was great",
                            style: TextStyle(fontWeight: FontWeight.normal ,
                                color: Theme.of(context).primaryColor , fontSize: 20),
                          ),
                        ],
                      ) : Column(
                        children:  [
                          Text(
                            "You Lose",
                            style: TextStyle(fontWeight: FontWeight.bold ,
                                color: Theme.of(context).primaryColor  , fontSize: 30),
                          ),
                          Text(
                            "Try your luck again",
                            style: TextStyle(fontWeight: FontWeight.normal ,
                                color: Theme.of(context).primaryColor, fontSize: 20),
                          ),
                        ],
                      ) ,


                    ],
                  ),
                ),
              ),) ,
              Expanded(flex: 3,child: Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    )),
                child: Center(
                  child:  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleButton(
                        onTap: () => context
                            .read<GameBloc>()
                            .add(GameRestart(isRestart: true)) ,
                        width: 40.0,
                        height: 40.0,
                        borderColor: Colors.white,
                        borderStyle: BorderStyle.solid,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.refresh,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(width: 10,) ,
                      CircleButton(
                        onTap: () => context
                            .read<GameBloc>()
                            .add(GameRestart(isRestart: false)) ,
                        width: 40.0,
                        height: 40.0,
                        borderColor: Colors.white,
                        borderStyle: BorderStyle.solid,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.home,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),

                    ],
                  ),
                ),
              ) ,) ,
            ],
          );
        }
        return Container() ;
      }, listener: (context, state) {
        if (state is Game) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const GameScreen(),
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
