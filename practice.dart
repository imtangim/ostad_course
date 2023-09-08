import 'dart:io';
import 'dart:math';

void main() {
  List<String> input1 = stdin.readLineSync()!.split(' ');
  List<String> input2 = stdin.readLineSync()!.split(' ');
  double x1 = double.parse(input1[0]);
  double y1 = double.parse(input1[1]);
  double x2 = double.parse(input2[0]);
  double y2 = double.parse(input2[1]);

  double distance = calculateDistance(x1, y1, x2, y2);

  print("Distance: ${distance.toStringAsFixed(2)}");
}

double calculateDistance(double x1, double y1, double x2, double y2) {
  double dx = x2 - x1;
  double dy = y2 - y1;
  return sqrt(dx * dx + dy * dy);
}
