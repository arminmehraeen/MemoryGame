import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/view/result/screen/result_screen.dart';
import 'package:memory_game/widget/bad_state_widget.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountdownTimerController controller =
    CountdownTimerController(endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 60 , onEnd: () {
      context
          .read<GameBloc>()
          .add(GameTimeOut());
    },) ;
    return Scaffold(
      body: BlocConsumer<GameBloc, GameState>(
          listener: (context, state) {
            if (state is GameFinished) {
              controller.dispose() ;
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultScreen(),
                  ));
            }
          },
          builder: (context, state) {
            if (state is Game) {
              return Container(
                color: Colors.blue,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CountdownTimer(
                        controller: controller,
                        widgetBuilder: (context, time) {
                          return Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle ,
                              color: Colors.white ,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(time!.sec.toString() ,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor),),
                            ),
                          ) ;
                        },
                      ),
                      const SizedBox(height: 10,) ,
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: state.cards.map((e) => SizedBox(
                          height: 100,
                          width: 100,
                          child: Card(
                            shape: e.isCompleted  ? const CircleBorder() : null ,

                            elevation: 3,
                            child: InkWell(
                              onTap: e.isCompleted || e.isShow ? null : () {
                                context
                                    .read<GameBloc>()
                                    .add(GameChange(card: e) );
                              },
                              child: Center(
                                child: e.isShow ?
                                Text( e.value.toString() , style: TextStyle(
                                  color: Theme.of(context).primaryColor ,
                                  fontSize: 20 ,
                                  fontWeight: FontWeight.bold
                                ),):
                                SvgPicture.asset(
                                  "assets/logo.svg",
                                  height: 40,
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                        )).toList(),
                      ) ,
                    ],
                  ),
                ),
              );
            }
            return const BadStateWidget();
          }),
    );
  }


}


