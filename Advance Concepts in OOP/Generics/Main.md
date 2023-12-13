# Generics


## Before The Start

Resources:
* [Java Generics - Baeldung](https://www.baeldung.com/java-generics)

* [Differences between E, T, and ?](https://stackoverflow.com/questions/6008241/what-is-the-difference-between-e-t-and-for-java-generics)

* [Java Generics Example Tutorial](https://www.digitalocean.com/community/tutorials/java-generics-example-method-class-interface#1-generics-in-java) 

* [<?> vs <? extends Object>](https://www.baeldung.com/java-generics-vs-extends-object)

* [<? extends Number> vs <T extends Number>](https://stackoverflow.com/questions/11497020/java-generics-wildcard-extends-number-vs-t-extends-number)

* [<? extends Number> vs <T extends Number - GPT Conversation](https://chat.openai.com/share/6176140f-6ee9-4bae-ba13-c3c4bd349c1c)


### Introduction to Generics

1. Generics was added in Java 5 to provide compile-time type checking and removing risk of ClassCastException that was common while working with collection classes

2.  If we don’t provide the type at the time of creation, the compiler will produce a warning that `GenericsType is a raw type. References to generic type GenericsType<T> should be parameterized`. 

> Tip: We can use @SuppressWarnings("rawtypes") annotation to suppress the compiler warning

### Naming Convention

* `E` - Element (used extensively by the Java Collections Framework, for example ArrayList, Set etc.)

* `K` - Key (Used in Map)

* `N` - Number

* `T` - Type

* `V` - Value (Used in Map)

* `S,U,V etc.` - 2nd, 3rd, 4th types 

### Generic Methods

1. Generic methods have a type parameter (the diamond operator enclosing the type) before the return type of the method declaration.

2. Type parameters can be bounded.

3. Generic methods can have different type parameters separated by commas in the method signature.

4. Method body for a generic method is just like a normal method.

Example of defining a generic method to convert an array to a list:

```java
// The <T> in the method signature implies that the method will be dealing with generic type T. 
//This is needed even if the method is returning void.
public <T> List<T> fromArrayToList(T[] a) {   
    return Arrays.stream(a).collect(Collectors.toList());
}
```

### Bounded Generics
We can restrict the types that a method accepts.

```java
// To declare an upper-bounded type, we use the keyword extends after the type, followed by the upper bound that we want to use
public <T extends Number> List<T> fromArrayToList(T[] a) {
    ...
}
```

### Wildcards With Generics (?)
> We know that Object is the supertype of all Java classes. However, a collection of Object is not the supertype of any collection.

For example, a List<Object> is not the supertype of List<String>, and assigning a variable of type List<Object> to a variable of type List<String> will cause a compiler error. 

```java
public static void paintAllBuildings(List<Building> buildings) {
    buildings.forEach(Building::paint);
}
```

we can’t use this method with a list of House, even though House is a subtype of Building.

```java
public static void paintAllBuildings(List<? extends Building> buildings) {
    ...
}
```

Now this method will work with type Building and all its subtypes. This is called an upper-bounded wildcard, where type Building is the upper bound.

* <b>Unbounded Wildcards:</b> `List<?>` represents a list of unknown type

* <b>Upper Bounded Wildcards:</b> `List<? extends Number>` represents a list of Number or its sub-types such as Integer and Double

* <b>Lower Bounded Wildcards:</b> `List<? super Integer>` represents a list of Integer or its super-types Number and Object

### <?> and <? extends Object>

consider these two methods:

```java
List<Integer> li = Arrays.asList(1, 2, 3);

public static void printListObject(List<Object> list) {    
    for (Object element : list) {        
        System.out.print(element + " ");    
    }        
}    

public static void printListWildCard(List<?> list) {    
    for (Object element: list) {        
        System.out.print(element + " ");    
    }     
}
```

`printListObject(li);` will not compile, and we’ll get this error: "The method printListObject(List<Object>) is not applicable for the arguments (List<Integer>)"

`printListWildCard(li)` will compile and will output: 1 2 3 to the console.

if we change the method signature for printListWildCard to:

```java
public static void printListWildCard(List<? extends Object> list)
```

#### Similarities
It would function in the same way as printListWildCard(List<?> list) did. This is due to the fact that Object is a supertype of all Java objects, and basically everything extends Object. So, a List of Integers gets processed as well.

#### Differences
* The reason for declaring a T is so that you can refer to it again

* `T` for the method itself, providing more flexibility and allowing both reading and writing to the Class with the specified type.


## TASK01

Suppose you have pre-Java5.0 code such as:

```java
class Box {
    Object o;

    Object get() {
        return o;
    }
}
```

### Question
<hr>

Outline two advantages to a client programmer if converting
the code to use generics. Give brief demo code (compilable).

### Answer
<hr>

Resources:
* https://dzone.com/articles/how-do-generic-subtypes-work



#### <b>Pain Points</b>


In existing code, if we were to do: 

```java
Box box = new Box();
box.o = 10;
```

The supplied `Integer` is no longer treated as its actual type, but rather, as an `Object`. This means:

1. We must <u>cast</u> the `Integer` when retrieved

```java
public class Main {
    public static void main(String[] args) {
        int result;

        // Initialize
        Box box = new Box();

        // Assign a integer
        box.o = 10;

        // We have to use type casting !!!
        result = (Integer) box.get();

        // Print the result
        System.out.println(result);
    }
}
```

2. Code that is outside of our control that uses this `Box` class may not have enough information to know what type to cast the retrieved element to.

Example:

 > if we add another element, but this time of type `Double`. If a consumer of our `Box` class is expecting a `Integer` object, performing a cast to `Integer` on the retrieved element will cause ClassCastException at runtime.

```java
public class Main {
    public static void main(String[] args) {
        String result;

        // Initialize
        Box box = new Box();

        // Assign a string
        box.o = 10;

        // Wrong type casting !!!
        // Runtime error !!!
        result = (String) box.get();

        // Print the result
        System.out.println(result);
    }
}
```


#### <b>1. Type Cast</b>

When we apply generics to `Box` class, we don't have to use type casting.

Box.java

```java
public class Box<T> {
    T o;

    T get() {
        return o;
    }
}
```

Main.java
```java
public class Main {
    public static void main(String[] args) {
        Integer result;

        // Initialize
        Box<Integer> box = new Box<>();

        // Assign a string
        box.o = 10;

        // We don't need to add type casting
        result = box.get();

        // Print the result
        System.out.println(result);
    }
}
```


#### <b>2. Type Safety</b>

When we apply generics to `Box` class, even if select wrong receiver type, we will come across a compile time error instead of runtime error

Box.java (same)

```java
public class Box<T> {
    T o;

    T get() {
        return o;
    }
}
```

Main.java
```java
public class Main {
    public static void main(String[] args) {
        // Wrong receiver type !!!
        String result;

        // Initialize
        Box<Integer> box = new Box<>();

        // Assign a string
        box.o = 10;

        // Compile time error
        // java: incompatible types: java.lang.Integer cannot be converted to java.lang.String
        result = box.get();

        // Print the result
        System.out.println(result);
    }
}
```



