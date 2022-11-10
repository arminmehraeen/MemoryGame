import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:memory_game/model/m_game_card.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';

part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  List<GameCard> generateCards() {
    List<GameCard> cards = [];
    int value = 1;
    for (int i = 1; i <= 16; i++) {
      cards.add(GameCard(id: i, value: value, isShow: false, isCompleted: false));
      if(i % 2 == 0) value++ ;
    }
    cards.shuffle();
    return cards;
  }

  GameBloc() : super(GameInitial()) {
    on<GameStart>((event, emit) => emit(Game(cards: generateCards())));

    on<GameTimeOut>((event, emit) => emit(GameFinished(result: false)));

    on<GameRestart>((event, emit) {
      if (state is GameFinished) {
        if (event.isRestart) {
          emit(Game(cards: generateCards()));
        } else {
          emit(GameInitial());
        }
      }
    });

    on<GameChange>((event, emit) async {
      final state = this.state;

      if (state is Game) {
        event.card.isShow = true;
        List<GameCard> cards =
            state.cards.map((e) => e.id == event.card.id ? event.card : e).toList();
        emit(Game(cards: cards));

        List<GameCard> temp =
            cards.where((card) => card.isShow && !card.isCompleted).toList();

        await Future.delayed(const Duration(milliseconds: 250));

        if (temp.length == 2) {
          if (temp.first.value == temp.last.value) {
            temp.first.isCompleted = true;
            temp.last.isCompleted = true;
          } else {
            temp.first.isShow = false;
            temp.last.isShow = false;
          }
          cards =
              state.cards.map((e) =>
              e.id == temp.first.id  ? temp.first : e.id == temp.last.id ? temp.last : e).toList();
          emit(Game(cards: cards));
          await Future.delayed(const Duration(milliseconds: 100));

          if (cards.where((element) => !element.isCompleted).isEmpty) emit(GameFinished(result: true));
        }

        // //emit(GameFinished(result: true));
      }
    });
  }
}
