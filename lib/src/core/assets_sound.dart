import 'dart:math' hide log;

class AppSound {
  static const String mainPathOfSound = 'sound/';
  static const String letterA = "${mainPathOfSound}a.mp3";
  static const String letterT = "${mainPathOfSound}t.mp3";
  static const String letterM = "${mainPathOfSound}m.mp3";
  static const String letterS = "${mainPathOfSound}s.mp3";
  static const String letterC = "${mainPathOfSound}c.mp3";
  static const String letterK = "${mainPathOfSound}c.mp3";

  static getSoundOfLetter({required String mainGameLetter}) {
    if (mainGameLetter.toLowerCase() == 'a') {
      return AppSound.letterA;
    }
    if (mainGameLetter.toLowerCase() == 't') {
      return AppSound.letterT;
    }
    if (mainGameLetter.toLowerCase() == 'm') {
      return AppSound.letterM;
    }
    if (mainGameLetter.toLowerCase() == 's') {
      return AppSound.letterS;
    }
    if (mainGameLetter.toLowerCase() == 'c') {
      return AppSound.letterC;
    }
    if (mainGameLetter.toLowerCase() == 'k') {
      return AppSound.letterK;
    }
    return AppSound.letterS;
  }
}
