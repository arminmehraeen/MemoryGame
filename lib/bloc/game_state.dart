part of 'game_bloc.dart';

@immutable
abstract class GameState {}

class GameInitial extends GameState {}

class Game extends GameState {
  final List<GameCard> cards ;
  Game({required this.cards}) ;
}

class GameFinished extends GameState {
  final bool result ;
  GameFinished({required this.result}) ;
}





