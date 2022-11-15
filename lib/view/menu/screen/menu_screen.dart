import 'package:circle_button/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:memory_game/bloc/game_bloc.dart';
import 'package:memory_game/constants/app_enum.dart';
import 'package:memory_game/view/game/screen/game_screen.dart';

import '../../../widget/custom_container_widget.dart';
import '../widget/footer_widget.dart';

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
                builder: (context) => const GameScreen(),
              ));
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: CustomContainerWidget(
                borderSide: CustomContainerBorderSide.bottom,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/logo.svg",
                      height: 150,
                      width: 150,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Memory Game",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleButton(
                    onTap: () => context.read<GameBloc>().add(GameStart()),
                    width: 60.0,
                    height: 60.0,
                    borderColor: Colors.white,
                    borderStyle: BorderStyle.solid,
                    backgroundColor: Colors.blue,
                    child: const Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const FooterWidget(creator: "Armin-Mehraein" , version: "1.1.0") ,
          ],
        ),
      ),
    );
  }
}
