# Example Code

```java
// Pet.java
abstract class Pet {
    String name;
    String gender;
    String sound;

    Pet(String name, String gender, String sound) {
        this.name = name;
        this.gender = gender;
        this.sound = sound;
    }

    abstract String makeSound();
}

// Dog.java
class Dog extends Pet {
    Bone bone;

    Dog(String name, String gender) {
        super(name, gender, "Woof");
        bone = new Bone();
    }

    String makeSound() {
        return "Woof";
    }

    Bone getBone() {
        return bone;
    }
}

// Cat.java
class Cat extends Pet {
    Fish fish;

    Cat(String name, String gender) {
        super(name, gender, "Meow");
        fish = new Fish();
    }

    String makeSound() {
        return "Meow";
    }

    Fish getFish() {
        return fish;
    }
}

// Bone.java
class Bone {
    String printString = "$==$";

    String toString() {
        return printString;
    }
}

// Fish.java
class Fish {
    String printString = "}==*->";

    String toString() {
        return printString;
    }
}

// PersonWithAPet.java
class PersonWithAPet {
    Pet pet;

    void setPet(Pet pet) {
        this.pet = pet;
    }

    String toString() {
        return "Person's Pet: " + pet.toString();
    }
}

// Main.java
class Main {
    public static void main(String[] args) {
        Cat cat = new Cat("Whiskers", "Female");
        Dog dog = new Dog("Buddy", "Male");

        PersonWithAPet person1 = new PersonWithAPet();
        PersonWithAPet person2 = new PersonWithAPet();

        person1.setPet(cat);
        person2.setPet(dog);

        System.out.println(person1);
        System.out.println(person2);
    }
}
```

## `abstract class Pet` Vs `class Pet`

### Example of `abstract class Pet`

```java
// You can not create an object from the abstract class
// You have to use with inheritance
abstract class Pet{
    String name;

    // Constructor
    Pet(name){
        // unless you define your own super or this first line of every constructor is;
        // super();
        this.name = name;
    }


    // It must be overridden by the subclass 
    abstract String makeSound();

    // It can used or overridden by the subclass
    String walk(){
        return "Walking is starting...";
    }
}
```

### Example of `class Pet`

```java
class Pet{
    String name;

    // Constructor
    Pet(name){
        // unless you define your own super or this first line of every constructor is;
        // super();
        this.name = name;
    }

    // It must be overridden by the subclass 
    abstract String makeSound();

    // It can used or overridden by the subclass
    String walk(){
        return "Walking is starting...";
    }
}
```

### My Opinion
There are several animals in the example code and they  have common attributes and methods.  For this reason, we should keep these common things in a single place.  We should prefer abstract class


## Data Types For `name`, `gender` And `sound`
```java
abstract class Pet{
    // Name can be anything
    // For this reason, we should define name as a string
    String name; 

    // Sound can be anything
    // For this reason, we should define name as a string
    String sound;

    // The values that gender value can take are obvious
    // We do not want users to enter a value other than these
    // For this reason, we should use the enum data type
    private Gender gender;
    public enum Gender {
        Male,
        Female;
    }
}
```

##  `Pet(...)` Constructor Options 
```java
abstract class Pet{
    String name; 
    String sound;
    private Gender gender;
    public enum Gender {
        Male,
        Female;
    }

    // It is constructor
    // The default constructor is the no-argument constructor automatically generated 
    // First line of every constructor unless you define your own super or this is super();
    Pet() {
        // name = "unknown";
        // sound = "unknon";
        // gender = Gender.Male;
        this("unknown", "unknown", Gender.Male);
    }

    // Overloading: Same methods with different parameter signs
    Pet(name, sound) {
        // name = this.name;
        // sound = this.sound;
        this("unknown", "unknown", null);
    }

    // Overloading: Same methods with different parameter signs
    Pet(name, sound, gender) {
        // super();
        name = this.name;
        sound = this.sound;
        gender = this.gender;
    }

}
```

### My Opinion
You can define objects in different ways due to multiple constructors. This feature allows you to use the class more flexibly.

##  `abstract String makeSound()` Vs `String makeSound()` Vs `void makeSound()`

```java
abstract class Pet{
    // It must be overridden by the subclass 
    abstract String makeSound();
    
    // It can used or overridden by the subclass
    String makeSound(){
        return "unknown";
    }

    // It can used or overridden by the subclass
    void makeSound(){
        System.out.println("unknown");
    }
}
```

### My Opinion
Each animal has its sound. For this reason, each animal class should override the makeSound method for its sounds, and the method return type should be String. If you set the method return type to void, you can not use that method out of print-out operation, but you might want to use it in a toString() method or inside another method.  

## Adding Attribute `FoodThing food` With The Introduction Of `class FoodThing` From Which `Bone` And `Fish` Are Derived.

```java
// FoodThing should be abstract because a dog has a bone and a cat has a fish. 
// They don't have something like food thing. We assign spesific foods to animals.
class abstract FoodThing{
    String printString;

    // Constructor
    FoodThing(){
        this(""); // FoodThing("");
    }

    // Overloading
    FoodThing(String printString){
        this.printString = printString;
    }

    // Common method for all foods
    String toString() {
        return printString;
    }
}

class Bone extends FoodThing{
    // constructor
    Bone(String printString){
        super(printString); // FoodThing(printString)
    }

    // ... for extra attributes & methods
}

class Fish extends FoodThing{
    // constructor
    Fish(String printString){
        super(printString); // FoodThing(printString)
    }

    // ... for extra attributes & methods
}

class Cat extends Pet {
    // Cat HAS-A food
    FoodThing food;

    // Constructor
    Cat(String name, String gender) {
        super(name, gender, "Meow"); // Cal pet constuctor

        // Polymorphism
        // Create food object as a fish
        food = new Fish();
    }

    // Return fish
    FoodThing getFish() {
        return food;
    }
}

class Dog extends Pet {
    // Dog HAS-A food
    FoodThing food;

    // Constructor
    Dog(String name, String gender) {
        super(name, gender, "Woof"); // Cal pet constuctor
        
        // Polymorphism
        // Create food object as a bone
        food = new Bone(); 
    }

    // Return bone
    FoodThing getBone() {
        return food;
    }
}
```

## `Bone bone;` & `bone = new Bone();` Vs `Bone bone = new Bone(); `

### Example of `Bone bone;` & `bone = new Bone();`
```java
class Dog extends Pet {
    // Lazy loading
    Bone bone;

    // Constructor
    Dog(String name, String gender) {
        super(name, gender, "Woof");
        bone = new Bone();
    }
}
```

### Example of `Bone bone = new Bone(); `
```java
class Dog extends Pet {
    // Eager loading
    Bone bone =  new Bone();

    // Constructor
    Dog(String name, String gender) {
        super(name, gender, "Woof");
        bone = new Bone();
    }
}
```

### My Opinion
Eager loading means that data or objects are loaded immediately. Data or objects are loaded before they are requested. This approach allows for quick use of data, but it can lead to unnecessary loading.

Lazy loading means that data or objects are loaded only when they are needed. This approach prevents unnecessary loading and allows for more efficient resource utilization.

For this reason, I prefer lazy loading.

##  `Dog(...)` Constructor Options
```java
class Dog extends Pet {
    Bone bone; // Lazy loading

    
    Dog() {
        // Dog(name, gender, "Woof");
        this(name, gender, "Woof");
    }

    // Overloading
    Dog(String name) {
        // Dog(name, gender, "Woof");
        this(name, "Male", "Woof");
    }

    // Overloading
    Dog(String gender) {
        // Dog(name, gender, "Woof");
        this("unknown", gender, "Woof");
    }

    // Overloading
    Dog(String name, String gender) {
        // Pet(name, gender, "Woof");
        super(name, gender, "Woof");
        bone = new Bone();
    }
}
```

### My Opinion
You can define objects in different ways due to multiple constructors. This feature allows you to use the class more flexibly.

## `super(name, gender, "Woof");`
```java
class Dog extends Pet {
    Bone bone; // Lazy loading

    // It is constructor
    // The default constructor is the no-argument constructor automatically generated 
    // unless you define another constructor.
    // So we can remove this method
    Dog(String name, String gender) {
        // First line of every constructor unless you define your own super or this is super();
        // super();

    
        super(name, gender, "Woof"); // Pet(name, gender, "Woof");
        bone = new Bone();
    }
}
```

 ## `getBone()` Vs `Dog.bone` 

 ### Example of `getBone()`
 ```java
 class Dog extends Pet {
    // Make private
    private Bone bone;

    // Access with getter method
    // This an example of encapsulation
    Bone getBone() {
        return bone;
    }
}
 ```

 ### Example of `Dog.bone` 
```java
class Dog extends Pet {
    // Make public
    public Bone bone;
}
```

## My opinion
If we use `Dog.bone` and then we want to change the variable name of bone,  `Dog.bone` does not work, but if we use the getter method, we can change the variable name and manipulate the data

## `Bone.java` Worthy Of A Class? If So Why?
```java
class Bone {
    String printString = "$==$";

    String toString() {
        return printString;
    }
}
```

## My Opinion
Yes, there should be a class. Because the way each food is represented is different. Each food has its own unique characteristics. For example: the sound that comes out after you beat, is there a date of deterioration or not?, under what conditions should be stored, etc.

## Attribute `printString` - Worth Having This Or Not?

### Example with `printString`

```java
class Bone {
    String printString = "$==$";

    String toString() {
        return printString;
    }
}
```

### Example without `printString`

```java
class Bone {
    String toString() {
        return "$==$";;
    }
}
```

## My Opinion
If we have just one attribute used in the toString() method, we can return the string directly