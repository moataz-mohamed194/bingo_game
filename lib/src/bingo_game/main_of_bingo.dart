import 'package:bingo_game/src/bingo_game/pages/bingo_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'manager/bingo_cubit.dart';
import 'models/game_model.dart';

class MainOfBingo extends StatelessWidget {
  final void Function(
      {required bool stateOfStringIsWord,
      required String stateOfStringWillSay}) actionOfSavrIns;
  final Function() animationOfCorrectAnswer;
  final Function() backToMainAvatar;
  final Function() addWrongAnswer;
  final List<GameModel> data;
  final int index;
  final String? stateOfAvatar;

  const MainOfBingo(
      {super.key,
      required this.data,
      required this.animationOfCorrectAnswer,
      required this.backToMainAvatar,
      required this.index,
      required this.actionOfSavrIns,
      required this.addWrongAnswer,
      required this.stateOfAvatar});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BingoCubit>(
        create: (_) => BingoCubit(
              gameData: data[index],
            ),
        child: BingoGameScreen(
            stateOfAvatar: stateOfAvatar,
            actionOfSavrIns: actionOfSavrIns,
            animationOfCorrectAnswer: animationOfCorrectAnswer,
            backToMainAvatar: backToMainAvatar,
            addWrongAnswer: addWrongAnswer));
  }
}
