import 'dart:io';

void main() {
  // Read input values
  List<int> input = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  int l1 = input[0];
  int r1 = input[1];
  int l2 = input[2];
  int r2 = input[3];

  // Print the first segment: [l1, l2)
  for (int i = l1; i < l2; i++) {
    stdout.write('$i ');
  }

  // Print the second segment: [r2 + 1, r1 + 1)
  for (int i = r2 + 1; i <= r1; i++) {
    stdout.write('$i ');
  }

  // Print a newline character at the end
  print('');
}
