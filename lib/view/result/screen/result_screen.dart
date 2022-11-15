import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/constants/app_enum.dart';
import 'package:memory_game/view/game/screen/game_screen.dart';
import 'package:memory_game/view/menu/screen/menu_screen.dart';
import 'package:memory_game/view/result/widget/result_message_widget.dart';
import 'package:memory_game/widget/custom_container_widget.dart';

import '../../../widget/bad_state_widget.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<GameBloc, GameState>(builder: (context, state) {
        if (state is GameFinished) {
          return Column(
            children: [
              Expanded(flex: 4,child: state.result ?
                const ResultMessageWidget(title: "You Won", subtitle: "Your work was great") :
                const ResultMessageWidget(title: "You Lose", subtitle: "Try your luck again"),) ,
              Expanded(flex: 3,child:

              CustomContainerWidget(borderSide: CustomContainerBorderSide.top,child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
              ),) ,


              ) ,
            ],
          );
        }
        return const BadStateWidget();
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
