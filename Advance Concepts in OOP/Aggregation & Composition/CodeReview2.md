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
abstract class AbstractPet{
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

// subclass
class Dog extends AbstractPet{
    
    // Overrided method
    @Override
    String makeSound{
        return "Hav Hav Hav!!!";
    }
}
```

### Example of `class Pet`

```java
// base class
class Pet{
    String name;

    // Constructor
    Pet(name){
        // unless you define your own super or this first line of every constructor is;
        // super();
        this.name = name;
    }

    // It can used or overridden by the subclass
    String makeSound(){
        return "Default sound";
    }

    // It can used or overridden by the subclass
    String walk(){
        return "Walking is starting...";
    }
}

// subclass
class Dog extends AbstractPet{
    
    // Overrided method
    @Override
    String makeSound{
        return "Hav Hav Hav!!!";
    }
}
```

### Usage For Client Programmers
```java
    Pet pet = new Pet(); // It works
    AbstractPet pet_2 = new AbstractPet(); // It throws an error

    Pet dog = new Dog();
    dog.makeSound(); // you can use this method with overriding or without overriding

    AbstractPet dog = new Dog();
    dog.makeSound(); // you can use this method with overriding

```

### My Opinion

<u>USE ABSTRACT CLASS</u>

* The main difference between these two examples is the usage of the make sound method.
* In a real-world scenario, there is no creature type of pet. There are several creatures, and all of them have their kind. We called a group of creatures a Pet.
* For this reason, we should not create any object from the Pet.  The pet should hold a reference to some animals.
* In addition, pets don't have a common sound. The method of making sounds should be overridden in each class because all pets have unique sounds. 
    


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

    // control method for enum
    Gender checkEnum(String gender){
        Gender result = null;

        // iterate gender values
        for (Gender g : Gender.values()){
            
            // if enum includes user input
            if (g.name().equalsIgnoreCase(gender)){
                result = g; // set enum value
                break;
            }     
        }

        // return null or valid enum value
        return result;
    }

    // constructor
    Pet(String name, String sound, String gender){
        this.name = checkEnum(name); // check enum
        this.sound = sound;
        this.gender = gender;
    }
}

// subclass
class Dog extends Pet{
    // constructor
    Dog(String name, String sound, String gender){
        super(name, sound, gender);
    }
}
```

### Usage For Client Programmers
```java
    Pet pet = new Dog("tom", "heyy", "Male"); // it works correctly
    Pet pet_2 = new Dog("tom", "heyy", "No"); // it sets gender as null
```

##  `Pet(...)` Constructor Options 
```java
abstract class Pet{
    String name; 
    String sound;
    Gender gender;

    public enum Gender {
        Male,
        Female;
    }

    // INFO
    // The default constructor is the no-argument constructor automatically generated 
    // First line of every constructor unless you define your own super or this is super();

    // It is no-arg constructor. 
    // Not a default constructor
    Pet() {
        // name = "unknown";
        // sound = "unknon";
        // gender = Gender.Male;
        this("unknown", "unknown", Gender.Male.toString());
    }

    // Overloading: Same methods with different parameter signs
    Pet(String name, String sound) {
        // name = this.name;
        // sound = this.sound;
        this(name, sound, Gender.Male.toString());
    }

    // Overloading: Same methods with different parameter signs
    Pet(String name, String sound, String gender) {
        // super();
        this.name = name;
        this.sound = sound;
        this.gender = checkEnum(gender);
    }

    // control method for enum
    Gender checkEnum(String gender){
        Gender result = null;

        // iterate gender values
        for (Gender g : Gender.values()){

            // if enum includes user input
            if (g.name().equalsIgnoreCase(gender)){
                result = g; // set enum value
                break;
            }     
        }

        // return null or valid enum value
        return result;
    }
    
}

// subclass
class Dog extends Pet{
    // Overloading: Same methods with different parameter signs
    Dog(String name, String sound, String gender) {
        // Pet(name, sound, gender);
        super(name, sound, gender);
    }
  
    // Overloading: Same methods with different parameter signs
    Dog(String name, String sound) {
        super(name, sound);
    }

    // Overloading: Same methods with different parameter signs
    Dog(){
        super();
    }
}
```

### Usage For Client Programmers
```java
    Pet dog = new Dog("Tom","Hav hav","Male");
    Pet dog = new Dog("Max","Hav hav");
    Pet dog = new Dog();
```

### My Opinion
You can define objects in different ways due to multiple constructors. This feature allows you to use the class more flexible. If you can define multiple constructors with different parameters, you decrease crash rating and cover multiple cases with default values. 

##  `abstract String makeSound()` Vs `String makeSound()` Vs `void makeSound()`

```java
abstract class Pet{
    // It must be overridden by the subclass 
    abstract String makeSoundAbstract();
    
    // It can used or overridden by the subclass
    String makeSoundString(){
        return "unknown";
    }

    // It can used or overridden by the subclass
    void makeSoundVoid(){
        System.out.println("unknown");
    }
}
```

### Usage For Client Programmers
```java
class Dog extend Pet(){
    
    @Override
    String makeSoundAbstract(){
        return "hav hav!";
    }

    String toString(){
        return "Dog" + makeSoundAbstract();
    }
}

class Cat extend Pet(){
    
    @Override
    String makeSoundAbstract(){
        return "Miav miav!";
    }

    String toString(){
        return "Cat" + makeSoundAbstract();
    }
}

Pet dog = new Pet();
dog.makeSoundAbstract(); // hav hav

Pet cat = new Cat();
cat.makeSoundAbstract(); // miav miav
```

### My Opinion
<u>USE ABSTRACT MAKE SOUND</u>

* Each animal has its sound. For this reason, each animal class should override the makeSound method for its sounds and the method return type should be String

* If you set the method return type to void, you can not use that method out of print-out operation, but you might want to use it in a toString() method or inside another method.  

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

### Usage For Client Programmers
```java
    Pet dog = new Dog("Tom", "Male");
    dog.getBone // It returns a bone object

    Pet cat = new Cat("Mia", "Female");
    dog.getFish // It returns a fish object
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
* Eager loading means that data or objects are loaded immediately. Data or objects are loaded before they are requested. This approach allows for quick use of data, but it can lead to unnecessary loading.

* Lazy loading means that data or objects are loaded only when they are needed. This approach prevents unnecessary loading and allows for more efficient resource utilization.

* For example, if we have lots of data that is waiting printed out with a for loop, we don't want to that program asks the data for each iteration. So, we can use eager loading in this case. In this project, we don't have a huge data on the database. So we don't need to load data before the calling. For this reason, we should prefer lazy loading.

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
### Usage For Client Programmers
```java
    Pet dog = new Dog("Max","Hav hav"); // it calls two parameter constructor
    Pet dog = new Dog(); // it calls zero-arg constructor
```

### My Opinion
You can define objects in different ways due to multiple constructors. This feature allows you to use the class more flexible. If you can define multiple constructors with different parameters, you decrease crash rating and cover multiple cases with default values.

## `super(name, gender, "Woof");`
```java
class Dog extends Pet {
    Bone bone; // Lazy loading

    // It is constructor
    Dog(String name, String gender) {
        // First line of every constructor unless you define your own super or this is super();
        // super();

    
        super(name, gender, "Woof"); // Pet(name, gender, "Woof");
        bone = new Bone();
    }
}
```

### Usage For Client Programmers
```java
    // it calls two parameter constructor
    // Dog constructor -> Pet Constructor with super keyword
    Pet dog = new Dog("Max","Hav hav"); 
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
        // We can manipulete the data
        // DATA BINDING
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

### Usage For Client Programmers
```java
    Dog dog = new Dog();
    dog.getBone();

    // -------------

    Dog dog = new Dog();
    dog.bone;
```

## My opinion
If we use `Dog.bone` and then we want to change the variable name of bone,  `Dog.bone` does not work, but if we use the getter method, we can change the variable name and manipulate the data. Also, if we use direct access and then change the access modifier option of that variable, client programmer will come accross an error while he/his triying to reach the variable.

## `Bone.java` Worthy Of A Class? If So Why?
```java
class Bone {
    String printString = "$==$";

    String toString() {
        return printString;
    }
}

class Fish {
    String printString = "<<<<*>";

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
    String date = "10/02/2024"

    String toString() {
        return "Bone:" + printString + "@" + date;
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

### My Opinion
If we have just one attribute used in the toString() method, we can return the string directly.