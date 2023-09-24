import 'dart:io';

void main() {
  int counter = 0;

  for (int i = 0; i < 10; i++) {
    List<String> input = stdin.readLineSync()!.split("");
    for (String value in input) {
      if (value == "T") {
        counter++;
        print("${input.join()} has T");
        break;
      }
    }
  }
  print(counter);
}
