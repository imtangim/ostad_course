class Car {
  static int numberOfCars =
      0; 
  String brand;
  String model;
  int year;
  late double milesDriven; 

  Car(this.brand, this.model, this.year) {
    this.milesDriven = 0;
    numberOfCars++;
  }

  void drive(double miles) {
    milesDriven += miles;
  }

  double getMilesDriven() {
    return milesDriven;
  }

  String getBrand() {
    return brand;
  }

  String getModel() {
    return model;
  }

  int getYear() {
    return year;
  }

  int getAge() {
    int currentYear = DateTime.now().year;
    int age = currentYear - year;
    return age;
  }
}

void main() {
  Car car1 = Car("Toyota", "Camry", 2020);
  Car car2 = Car("Honda", "Civic", 2018);
  Car car3 = Car("Ford", "F-150", 2015);

  car1.drive(10000);
  car2.drive(8000);
  car3.drive(15000);

  print(
      "Car 1: ${car1.getBrand()} ${car1.getModel()} ${car1.getYear()} Miles: ${car1.getMilesDriven()} Age: ${car1.getAge()}");
  print(
      "Car 2: ${car2.getBrand()} ${car2.getModel()} ${car2.getYear()} Miles: ${car2.getMilesDriven()} Age: ${car2.getAge()}");
  print(
      "Car 3: ${car3.getBrand()} ${car3.getModel()} ${car3.getYear()} Miles: ${car3.getMilesDriven()} Age: ${car3.getAge()}");

  print("Total number of cars created: ${Car.numberOfCars}");
}

// output:
// Car 1: Toyota Camry 2020 Miles: 10000 Age: 3
// Car 2: Honda Civic 2018 Miles: 8000 Age: 5
// Car 3: Ford F-150 2015 Miles: 15000 Age: 8
// Total number of cars created: 3