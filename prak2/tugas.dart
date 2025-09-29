import 'dart:math';

void main() {
  for (int i = 0; i < 201; i++) {
    bool prima = true;

    if (i <= 1) {
      prima = false;
    } else {
      for (int j = 2; j <= sqrt(i).toInt(); j++) {
        if (i % j == 0) {
          prima = false;
          break;
        }
      }
    }

    if (prima) {
      print('Bilangan prima: $i');
      print('Rocky Alessandro Kristanto 2341720197');
      continue;
    }
  }
}
