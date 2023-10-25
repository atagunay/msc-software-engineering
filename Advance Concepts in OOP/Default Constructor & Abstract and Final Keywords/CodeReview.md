![uml](/images/Advance%20Concepts%20in%20OOP/uml.jpg)

## Compilable code

```java
// We can't create new objects from the abstract classes
abstract class Bird {
    boolean cansing;

   // It is zero arg constructor not a default constructor
   // The default constructor is the no-argument constructor automatically generated 
   // unless you define another constructor.
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
   FlyingBird(){
     // First line of every constructor unless you define your own super or this is super();
     // super(); it means Bird()
   }

   @Override 
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
   // Constructor
   FlightlessBird(){};

   @Override 
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
     // bird_2.sings(); // This method comes from the Bird class
   }
 }
 ```

 ## `abstract class Bird` Vs `class Bird`

 ### Example of `abstract class Bird`

 ```java
 // We can't create new objects from the abstract classes
abstract class BirdAbstract{
    boolean cansing;
 
   BirdAbstract() {
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

 class SubBirdFromAbstract extends BirdAbstract{
    @Override
    void sing(){
      System.out.println("overrided method");
    }
 }
 ```

 ### Example of `class Bird`

  ```java
  // We can create new objects from this class
 abstract class Bird {
    boolean cansing;
 
   Bird() {
     // First line of every constructor unless you define your own super or this is super();
     // super();
   }
 
    // This is the concrete method
    void sing(){
      System.out.println("Cik Cik Cik!");
    }
 }

  class SubBird extends Bird{
 }
 ```

### Usage For Client Programmers
```java
  // Class usage
  Bird bird = new SubBird(); // It works

  // Invalid Abstract usage 
  BirdAbstract bird_2 = new BirdAbstract(); // It throws an error
  
  // Valid Abstract usage 
  // Polymorphism
  BirdAbstract bird_3 = new SubBirdFromAbstract(); // It works
```

### My Opinion

<u>USE ABSTRACT CLASS</u>

* The main difference between these two examples is the usage of the sing method and and purpose of Bird class.
* In a real-world scenario, there is no creature type of bird. There are several creatures, and all of them have their kind. We called a group of creatures as bird.
* For this reason, we should not create any object from the Bird.  The bird should hold a reference to some birds.
* In addition, birds don't have a common sound. The method of sing should be overridden in each class because all birds have unique sounds. 

## Data Types For `cansing`
  ```java
 abstract class Bird {
    // This value can be true/false. For this reason, we should use boolean type
    boolean cansing;

    Bird(boolean cansing){
      this.cansing = cansing;
    }
 }

 class SubBird extends Bird{
    SubBird(boolean cansing){
      // Bird(cansing);
      super(cansing);
    }
 }
 ```

 ### Usage For Client Programmers
```java
  Bird bird = new SubBird(true); 
```

##  `Bird(...)` Constructor Options
```java
abstract class Bird {
    boolean cansing; // lazy loading
 
   Bird() {
     // First line of every constructor unless you define your own super or this is super();
     cansing = true;
   }

  // Overloading: Same methods with different parameter signs
   Bird(boolean cansing){
      this.cansing = cansing;
   }
 }

  class SubBird extends Bird{
    SubBird(boolean cansing){
      // Bird(cansing);
      super(cansing);
    }
 }
```

 ### Usage For Client Programmers
```java
  Bird bird = new SubBird(false);  // Set cansing = false
  Bird bird_2 = new SubBird();     // Set cansing = true
```

### My Opinion
You can define objects in different ways due to multiple constructors. This feature allows you to use the class more flexible. If you can define multiple constructors with different parameters, you decrease crash rating and cover multiple cases with values. 

##  `abstract String sing()` Vs `String sing()` Vs `void sing()`

```java
abstract class Bird{
    // It must be overridden by the subclasses
    abstract String singAbstract();
    
    // It can used or overridden by the subclass
    String singString(){
        return "cik cik";
    }

    // It can used or overridden by the subclass
    void singVoid(){
        System.out.println("cik cik");
    }
}
```

### Usage For Client Programmers
```java
class SubBird extend Bird(){
    
    @Override
    String singAbstract(){
        return "cik cik";
    }

    String toString(){
        return "SubBird" + singAbstract();
    }
}

class SubBird2 extend Bird(){
    
    @Override
    String singAbstract(){
        return "gak gak";
    }

    @Override
    String singString(){
        return "gak gak";
    }

    @Override
    void singVoid(){
        System.out.println("gak gak");
    }

    String toString(){
        return "SubBird2" + singAbstract();
    }
}

Bird bird_1 = new SubBird();
bird_1.singAbstract();      // return "cik cik"
bird_1.singString();        // return "cik cik"
bird_1.singVoid();          // printout "cik cik"


Bird bird_2 = new SubBird2();
bird_2.singAbstract();       // return "gak gak"
bird_2.singString();         // return "gak gak"
bird_2.singVoid();           // printout "gak gak"
```

### My Opinion
<u>USE ABSTRACT SING</u>

* Each bird has its sound. For this reason, each bird class should override the sing method for its sounds and the method return type should be String

* If you set the method return type to void, you can not use that method out of print-out operation, but you might want to use it in a toString() method or inside another method.  


##  `abstract boolean sings()` Vs `boolean sings()` Vs `void sings()`
```java
abstract class Bird{
    // It must be overridden by the subclass 
    abstract String singsAbstract();
    
    // It can used or overridden by the subclass
    boolean singsBoolean(){
        return true;
    }

    // It can used or overridden by the subclass
    void singsVoid(){
        System.out.println("True");
    }
}

// sub class
class WoodenBird extends Bird{
    String singsAbstract(){
      return "yes of course";
    }

    // Normally, we wait that all birds can sing
    // If there is a special case, we can override method
    @Override
    boolean singsBoolean(){
      return false;
  }
}
```

### Usage For Client Programmers
```java
Bird bird = new WoodenBird();
bird.singsAbstract();       // return "yes of course"
bird.singsBoolean();        // return false
bird.singsVoid();           // printout "True"
```


### My Opinion
<u>USE BOOLEAN SINGS</u>

* Normally, Each bird can sing. For this reason, each bird class should not override the sings method for its sounds. If there will be a special case, we can override default method and the method return type should be boolean

* If you set the method return type to void, you can not use that method out of print-out operation, but you might want to use it in a toString() method or inside another method.  

## Attribute `printString` vs just print out value?
```java
// base class
abstract class FlyingBird extends Bird {
  private String printString = "Cik cik cik"

  void sing() {
    System.out.println(printString + "from FlyingBird");
  }

  void setPrintString(String sound){
    this.printString = sound;
  }
}

// sub class
class SubBird extends FlyingBird{
}
```

```java
// base class
abstract class FlyingBird extends Bird {
  
  void sing() {
    System.out.println("Cik cik cik from FlyingBird");
  }
}

// sub class
class SubBird extends FlyingBird{
}
```

### Usage For Client Programmers
```java
    // with `printString` variable
    FlyingBird bird_1 = new SubBird();
    bird_1.sing(); // Cik cik cik from flyingbird
    bird_1.setPrintString("new value");
    bird_1.sing(); // new value from flyingbird

    // -----------------

    // without `printString`
    FlyingBird bird_2 = new SubBird();
    bone.sing(); // Cik cik cik from FlyingBird
    // you can not change the value
```

### My Opinion
If we have just one attribute used in the sing method, we can return the string directly but if we have several attributes and we want to update values of these attributes then we should use variables for holding data. Also, we might want to use same data in different values. 