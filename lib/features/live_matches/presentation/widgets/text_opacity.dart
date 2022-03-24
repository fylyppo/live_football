  import 'dart:math';

class TextOpacity {
  static double titleOpacity(double shrinkoffset) {
    return 1.0 - max(0.0, shrinkoffset * 2.4) / 200;
  }
}