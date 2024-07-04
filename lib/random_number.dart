import 'dart:math';

class RandomNumService {
  static int getOptionPosition() {
    return Random().nextInt(4);
  }

  static getNumberBasedOnAnswer(answer) {
    int min = answer - 20;
    int max = answer + 20;
    return min + Random().nextInt(max - min);
  }

  static int getNumber() {
    return (1 + Random().nextInt(99));
  }
}
