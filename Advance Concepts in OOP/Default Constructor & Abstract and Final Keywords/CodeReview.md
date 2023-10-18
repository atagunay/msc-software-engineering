![uml](/images/Advance%20Concepts%20in%20OOP/uml.jpg)

```java
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
   boolean sings() {
     return true;
   }

   // final boolean sings() {} => can't overrided
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

   void sing() {
     System.out.println("Cik cik cik from FlyingBird");
   }

   // This is the concrete method
   boolean flys(){
     return true;
   }
 }

 // FlightlessBird.java (and equivalent for similar: FlyingBird.java)
 // We can't create new objects from the abstract classes
 abstract class FlightlessBird extends Bird{
   FlightlessBird(){};

   void sing(){
     System.out.println("Cik cik cik from FlightlessBird");
   }
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
   void sing(){
     System.out.println("Cik cik cik from BlackBird");
   }
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
   void sing(){
     System.out.println("Cik cik cik from Emu");
   }
 }

 // This is the main class
 class BirdMaker {
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
 ```

 ## `abstract class Bird` Vs `class Bird`

 ### Example of `abstract class Bird`

 ```java
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
 ```

 ### Example of `class Bird`

  ```java
  // We can create new objects from class
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
 
    // This is the concrete method
    void sing(){
      System.out.println("Cik Cik Cik!");
    }
 }
 ```

 ### My Opinion
There are several birds in the example code and they  have common attributes and methods.  For this reason, we should keep these common things in a single place.  We should prefer abstract class.

## Data Types For `cansing`
  ```java
 abstract class Bird {
    // This value can be true/false. For this reason, we should boolean type
    boolean cansing;
 }
 ```

##  `Bird(...)` Constructor Options
```java
abstract class Bird {
    boolean cansing;
 
   Bird() {
     // First line of every constructor unless you define your own super or this is super();
     // super();
   }

  // Overloading: Same methods with different parameter signs
   Bird(boolean cansing){
      this.cansing = cansing;
   }
 }
```

### My Opinion
You can define objects in different ways due to multiple constructors. This feature allows you to use the class more flexibly.

##  `abstract String sing()` Vs `String sing()` Vs `void sing()`

```java
abstract class Bird{
    // It must be overridden by the subclass 
    abstract String sing();
    
    // It can used or overridden by the subclass
    String sing(){
        return "cik cik";
    }

    // It can used or overridden by the subclass
    void sing(){
        System.out.println("cik cik");
    }
}
```

### My Opinion
Each bird has its sound. For this reason, each bird class should override the sing method for its sounds, and the method return type should be String. If you set the method return type to void, you can not use that method out of print-out operation, but you might want to use it in a toString() method or inside another method.  


##  `abstract boolean sings()` Vs `boolean sings()` Vs `void sings()`
```java
abstract class Bird{
    // It must be overridden by the subclass 
    abstract String sings();
    
    // It can used or overridden by the subclass
    boolean sings(){
        return true;
    }

    // It can used or overridden by the subclass
    void sings(){
        System.out.println("True");
    }
}
```

### My opinion
Almost all birds can sing. For this reason, we should use `boolean sings`. It return True as a default. If there will be a sick bird that can not sing then we can override that method.

## Attribute `printString` vs just return value?
```java
  abstract class FlyingBird extends Bird {
  String printString = "Cik cik cik"

  void sing() {
    System.out.println(printString + "from FlyingBird");
  }
}
```

```java
  abstract class FlyingBird extends Bird {
  
  void sing() {
    System.out.println("Cik cik cik from FlyingBird");
  }
}
```

### My Opinion
If we want to edit sound and use this sound in different methods then we can create a variable like `printString`