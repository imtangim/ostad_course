void main() {
  List<int> grades = [85, 92, 78, 65, 88, 72];

  double sum = 0;
  for (int grade in grades) {
    sum += grade;
  }

  double average = sum / grades.length;
  int roundedAverage = average.round();

  print("Student's average grade: $average");
  print("Rounded average: $roundedAverage");

  if (roundedAverage >= 70) {
    print("Passed");
  } else {
    print("Failed");
  }
}

// output:module
// Student's average grade: 80
// Rounded average: 80
// Passed
