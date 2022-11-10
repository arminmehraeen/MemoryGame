part of 'game_bloc.dart';

@immutable
abstract class GameEvent {}

class GameStart extends GameEvent {
  GameStart() ;
}

class GameChange extends GameEvent {
  final GameCard card ;
  GameChange({required this.card}) ;
}

class GameTimeOut extends GameEvent {}

class GameRestart extends GameEvent {
  final bool isRestart ;
  GameRestart({required this.isRestart}) ;
}
