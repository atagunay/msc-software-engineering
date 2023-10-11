// We can't create new objects from the abstract classes
abstract class Bird {
    boolean cansing;
 
   // It is constructor
   // The default constructor is the no-argument constructor automatically generated 
   // unless you define another constructor.
   // So we can remove this method
   Bird() {
     // First line of every constructor unless you define your own super or this is super();
     // super();
   }
 
   // Abstract methods must be filled in the subclasses
   abstract void sing();
 
   // This is the concrete method
   // A concrete method means, the method has a complete definition 
   // but it can be overridden in the inherited class.
   // Can subclasses inherit/override concrete methods from an abstract superclass
   void sings() {}
 
   // final void sings() {} => can't overrided
 }
 
 //FlyingBird.java (and equivalent for similar: FlightlessBird.java)
 // We can't create new objects from the abstract classes
 abstract class FlyingBird extends Bird {
   // It is constructor
   // The default constructor is the no-argument constructor automatically generated 
   // unless you define another constructor.
   // So we can remove this method
   FlyingBird(){
     // First line of every constructor unless you define your own super or this is super();
     // super(); it means Bird()
   }
 
   // Filled with the empty body
   void sing() {}
 
   // This is the concrete method
   boolean flys(){
     return true;
   }
 }
 
 // FlightlessBird.java (and equivalent for similar: FlyingBird.java)
 // We can't create new objects from the abstract classes
 abstract class FlightlessBird extends Bird{
   FlightlessBird(){};
 
   // Filled with the empty body
   void sing(){}
 }
 
 
 // BlackBird.java (and equivalent for similar: Emu.java)
 // Blackbird extends FlyingBird
 // Blackbird can use attributes & methods from the FlyingBird
 class BlackBird extends FlyingBird {
   // There is a default constructor
   // Emu(){
   //   super(); it means FlyingBird()
   // }
 
   // As a best practice, we can add the @Override tag to the top of this method to emphasize overriding. 
   @Override
   void sing(){}
 }
 
 
 // Emu.java (and equivalent for similar: BlackBird.java)
 // Emu extends FlyingBird
 // Emu can use attributes & methods from the FlyingBird
 class Emu extends FlightlessBird{
   // There is a default constructor
   // Emu(){
   //   super(); it means FlightlessBird()
   // }
 
   // As a best practice, we can add the @Override tag to the top of this method to emphasize overriding. 
   @Override
   void sing(){}
 }
 
 // This is the main class
 class Main {
   public static void main(String[] args) {
     // Examples of polymorphism
     
     // Blackbird Constructor -> FlyingBird Constructor -> Bird Constructor -> Object Constructor
     Bird bird_1 = new BlackBird(); 
 
     // Emu Constructor -> FlightlessBird Constructor -> Bird Constructor -> Object Constructor
      Bird bird_2 = new Emu();
 
     // If Blackbird has its own method or attribute this line throws an error
     // bird_1.example_attribute
     // Because the superclass can not reach the subclass's attributes
     // But it can reach the same level of attributes & methods
     System.out.println(bird_1.cansing);
 
     bird_1.sing(); // This method comes from the BlackBird class
     // bird_2.signs(); // This method comes from the Bird class
   }
 }
 