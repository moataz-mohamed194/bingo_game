part of 'bingo_cubit.dart';

@immutable
class BingoInitial extends Equatable {
  List<dynamic>? cardsLetters;
  dynamic? gameData;
  List<int>? correctIndexes;
  int? correctAnswer;
  bool? stopAction;
  dynamic? chooseWord;

  BingoInitial(
      {this.gameData,
      this.correctIndexes,
      this.cardsLetters,
      this.stopAction,
      this.correctAnswer,
      this.chooseWord});

  BingoInitial copyWith(
      {dynamic? gameData,
      List<dynamic>? cardsLetters,
      dynamic? chooseWord,
      int? correctAnswer,
      bool? stopAction,
      List<String>? indexOfCorrectAnswers,
      List<int>? correctIndexes}) {
    return BingoInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        stopAction: stopAction ?? this.stopAction,
        chooseWord: chooseWord ?? this.chooseWord,
        correctAnswer: correctAnswer ?? this.correctAnswer,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  BingoInitial clearAllData() {
    return BingoInitial();
  }

  @override
  List<Object?> get props => [
        gameData,
        correctIndexes,
        cardsLetters,
        correctAnswer,
        chooseWord,
        stopAction
      ];
}
