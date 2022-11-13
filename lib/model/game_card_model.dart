import 'package:flutter/material.dart';

class GameCard {
  int id ;
  int value ;
  bool isShow ;
  bool isCompleted  ;

//<editor-fold desc="Data Methods">

  GameCard({
    required this.id,
    required this.value,
    required this.isShow,
    required this.isCompleted,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GameCard &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          value == other.value &&
          isShow == other.isShow &&
          isCompleted == other.isCompleted);

  @override
  int get hashCode =>
      id.hashCode ^ value.hashCode ^ isShow.hashCode ^ isCompleted.hashCode;

  @override
  String toString() {
    return 'GameCard{' +
        ' id: $id,' +
        ' value: $value,' +
        ' isShow: $isShow,' +
        ' isCompleted: $isCompleted,' +
        '}';
  }

  GameCard copyWith({
    int? id,
    int? value,
    bool? isShow,
    bool? isCompleted,
  }) {
    return GameCard(
      id: id ?? this.id,
      value: value ?? this.value,
      isShow: isShow ?? this.isShow,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'value': this.value,
      'isShow': this.isShow,
      'isCompleted': this.isCompleted,
    };
  }

  factory GameCard.fromMap(Map<String, dynamic> map) {
    return GameCard(
      id: map['id'] as int,
      value: map['value'] as int,
      isShow: map['isShow'] as bool,
      isCompleted: map['isCompleted'] as bool,
    );
  }

//</editor-fold>
}