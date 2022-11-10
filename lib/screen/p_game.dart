import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/screen/p_result.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountdownTimerController controller = CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 10 , onEnd: () {
      context
          .read<GameBloc>()
          .add(GameTimeOut());
    },) ;
    return Scaffold(
      body: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GameFinished) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultScreen(),
                  ));
            }
          },
          builder: (context, state) {
            if (state is Game) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CountdownTimer(
                      controller: controller,
                    ),
                    const Divider() ,
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: state.cards.map((e) => SizedBox(
                        height: 100,
                        width: 100,
                        child: Card(
                          color: e.isCompleted ? Colors.green :
                          e.isShow ? Colors.red : null ,
                          elevation: 3,
                          child: InkWell(
                            onTap: e.isCompleted || e.isShow ? null : () {
                              context
                                  .read<GameBloc>()
                                  .add(GameChange(card: e) );
                            },
                            child: Center(
                              child: e.isShow ?
                              Text( e.value.toString()):
                              const Icon(Icons.help_outline_sharp),
                            ),
                          ),
                        ),
                      )).toList(),
                    ) ,
                  ],
                ),
              );
            }
            return Container();
          }),
    );
  }
}
