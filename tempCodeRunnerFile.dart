import 'dart:io';

void main() {
  int num1 = int.parse(stdin.readLineSync()!);
  int num2 = int.parse(stdin.readLineSync()!);

  swap(num1, num2);
}

void swap(int a, int b) {
  print("Before swapping: num1 = $a, num2 = $b");
  int temp = a;
  a = b;
  b = temp;
  print("After swapping: num1 = $a, num2 = $b");
}
