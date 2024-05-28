import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/basic_of_every_game.dart';
import '../../core/phonetics_color.dart';
import '../../core/theme_text.dart';
import '../manager/bingo_cubit.dart';
import '../widget/item_card_widget.dart';

class BingoGameScreen extends StatelessWidget {
  final Function(
      {required bool stateOfStringIsWord,
      required String stateOfStringWillSay}) actionOfSavrIns;
  final Function() animationOfCorrectAnswer;
  final Function() backToMainAvatar;
  final Function() addWrongAnswer;
  final String? stateOfAvatar;

  const BingoGameScreen(
      {super.key,
      required this.actionOfSavrIns,
      required this.animationOfCorrectAnswer,
      required this.backToMainAvatar,
      required this.addWrongAnswer,
      required this.stateOfAvatar});

  @override
  Widget build(BuildContext context) {
    // final stateOfAvatar =
    //     context.watch<CurrentGamePhoneticsCubit>().state.stateOfAvatar;
    return Container(
        alignment: Alignment.center,
        // height: MediaQuery.of(context).size.height - (70.h),

        margin: EdgeInsets.only(right: 15.w),
        width: MediaQuery.of(context).size.width - (100.w),
        height: MediaQuery.of(context).size.height - 150.h,
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: AppColorPhonetics.DarkBorderColor, width: 5)),
        child:
            BlocConsumer<BingoCubit, BingoInitial>(listener: (context, state) {
          actionOfSavrIns(
              stateOfStringIsWord: false,
              stateOfStringWillSay: state.chooseWord?.letter ?? '');
        }, builder: (context, gameState) {
          return Center(
              child: Wrap(
            children: List.generate(
                (gameState.cardsLetters)?.length ?? 0,
                (rowIndex) => (gameState.cardsLetters)?[rowIndex].id == null
                    ? Container(
                        alignment: Alignment.center,
                        color: AppColorPhonetics.DarkBorderColor,
                        width:
                            (MediaQuery.of(context).size.width - (106.w)) / 3,
                        height:
                            (MediaQuery.of(context).size.height - 162.h) / 3,
                        child: Text(
                          'Bingo',
                          style: TextStyle(
                              fontSize: 39,
                              fontFamily: AppTheme.getFontFamily5(),
                              color: Colors.white),
                        ))
                    : ItemCardWidget(
                        body: (gameState.cardsLetters)?[rowIndex].letter ?? '',
                        maxHeight: MediaQuery.of(context).size.height - 162.h,
                        maxWidth: MediaQuery.of(context).size.width - (107.w),
                        hide: gameState.correctIndexes
                            ?.contains((gameState.cardsLetters)?[rowIndex].id),
                        index: rowIndex,
                        onTap: () async {
                          if ((gameState.correctIndexes?.contains(
                                          (gameState.cardsLetters)?[rowIndex]
                                              .id) ==
                                      false ||
                                  (gameState.correctIndexes == null) ||
                                  (gameState.correctIndexes?.isEmpty ??
                                      false)) &&
                              (stateOfAvatar == BasicOfEveryGame.stateOIdle ||
                                  stateOfAvatar == null) &&
                              gameState.stopAction != true) {
                            if ((gameState.cardsLetters)?[rowIndex]
                                    .letter
                                    ?.toLowerCase() ==
                                (gameState.chooseWord?.letter?.toLowerCase() ??
                                    '')) {
                              await animationOfCorrectAnswer();
                              int countOfCorrect = await context
                                  .read<BingoCubit>()
                                  .increaseCountOfCorrectAnswers();
                              await context
                                  .read<BingoCubit>()
                                  .addTheCorrectAnswer(
                                      idOfUserAnswer:
                                          (gameState.cardsLetters)?[rowIndex]
                                                  .id ??
                                              0);
                              // context
                              //     .read<CurrentGamePhoneticsCubit>()
                              // .addStarToStudent(
                              //   stateOfCountOfCorrectAnswer: countOfCorrect,
                              //   mainCountOfQuestion: gameState
                              //           .gameData?.gameLetters?.length ??
                              //       0,
                              // );

                              bool isLastLesson = context
                                  .read<BingoCubit>()
                                  .checkIfIsTheLastGameOfLesson();
                              if (isLastLesson == true) {
                                await Future.delayed(
                                    const Duration(seconds: 2));
                                Navigator.of(context).pop();
                              } else {
                                await backToMainAvatar();
                                await context
                                    .read<BingoCubit>()
                                    .getTheRandomWord(awaitTime: false);
                              }
                            } else {
                              addWrongAnswer();
                            }
                          }
                        },
                      )),
          ));
        }));
  }
}
