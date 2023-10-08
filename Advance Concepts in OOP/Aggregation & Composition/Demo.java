// Pedal.java (and equivalent for similar: Bone.java)
class Pedal{
  String startCommand = "Pedaling...";

  
  public String toString(){
    return startCommand;
  }
}

// Bike.java (and equivalent for similar: Dog.java)
// Bike IS-A auto
class Bike extends Auto {
  Pedal pedal;
  
  // Constructor
  public Bike(String brand, String model){
    super(brand, model);
    pedal = new Pedal();
  }

  // An example of overloading
  // There are same methods with different parameter signs
  public Bike(){
    // Call constructor with parameters - Bike("Non-Brand", "Non-model");
    // It is an example of DRY (Don't Repeat Yourself)
    this("Non-Brand", "Non-model");
    pedal = null;
  }

  // Overrided from the Auto class
  // It defines the start command of the bike
  @Override
  String start(){
    return pedal.toString();
  }

  public String toString(){
    return "Bike and " + pedal.toString();
  }
}

// Engine.java (and equivalent for similar: Fish.java)
class Engine{
  String startCommand = "Engine is starting...";

  public String toString(){
    return startCommand;
  }
}

// Car.java (and equivalent for similar: Cat.java)
// Car IS-A auto
class Car extends Auto{
  
  // Car HAS-A engine  
  Engine engine;
  
  // Constructor of the Car
  public Car(String brand, String model){
    super(brand, model);
    engine = new Engine();
  }

  // An example of overloading
  // There are same methods with different parameter signs
  public Car(){
    // Call constructor with parameters - Car("Non-Brand", "Non-model");
    // It is an example of DRY (Don't Repeat Yourself)
    this("Non-Brand", "Non-model");
    engine = null;
  }
  
  // Overrided from the Auto class
  // It defines the start command of the car
  @Override
  String start(){
    return engine.toString();
  }

  public String toString(){
    return "Car and " + engine.toString();
  }
}

//Auto.java (and equivalent for similar: Pet.java)
abstract class Auto{
  String brand;
  String model;
  
  // Constructor of Auto
  public Auto(String brand, String model){
    this.brand = brand;
    this.model = model;
  }

  // This method must be overrided by the derived classes
  // It defines the starting command of the auto
  abstract String start();
}

//PersonWithAuto.java (and equivalent for similar: PersonWithAPet.java)
class PersonWithAuto {

  // PersonWithAuto has a auto
  // It can be Car or Bike  
  Auto auto;

  // An example of encapsulation
  // We can add validation rules in here
  // We can use enums for 
  public void setAuto(Auto auto){
    this.auto = auto;
  }

  // Overrided by the Java main Object class
  public String toString(){
    return "Person with " + auto.toString();
  }
}

class Main {
  public static void main(String[] args) {

    // Example of polymorphism
    // Base class reference variable can point to derived class object
    Auto auto_car = new Car("BMW", "2023");
    Auto auto_bike = new Bike("B’Twin", "2022");

    // New person objects
    PersonWithAuto person_1 = new PersonWithAuto();
    PersonWithAuto person_2 = new PersonWithAuto();

    // person_1 has a car
    // person_2 has a bike
    person_1.setAuto(auto_car);
    person_2.setAuto(auto_bike);

    System.out.println(person_1); // #=> Person with Car and Engine is starting...
    System.out.println(person_2); // #=> Person with Bike and Pedaling...
  }
}
