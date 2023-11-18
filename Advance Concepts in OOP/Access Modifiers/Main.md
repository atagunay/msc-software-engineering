# Access Modifiers
Usefull Links:

* https://www.baeldung.com/java-access-modifiers#:~:text=When%20we%20don't%20use,package%20com.

* https://stackoverflow.com/questions/30384830/determining-fully-qualified-class-name-from-java-lang-string

* https://stackoverflow.com/questions/36382372/does-inheritance-across-packages-is-possible-also-how-do-we-compile-them

![steps](/images/Advance%20Concepts%20in%20OOP/access_1.png)
![steps](/images/Advance%20Concepts%20in%20OOP/access_2.png)

##  How to public access a packaged class from outside the package?

### 1. Using an import statement only to the packaged class

#### Steps

1. Make public the target class.

2. Import package definiton to requester class.

Main.java

```java
// Import fruits package to access apple class
import fruits.Apple;

public class Main {
    public static void main(String[] args) {
        Apple apple = new Apple();
    }
}
```
Apple.java
```java
// Apple in the fruits package
package fruits;

// public class
public class Apple {
}
```

<hr>

### 2. Using a variable definition only of the packaged class

#### Steps

1. Make public the target class.

2. Make public the target variable.

3. Import package definiton to requester class.

Main.java

```java
// Import fruits package to access apple class
import fruits.Apple;

public class Main {
    public static void main(String[] args) {
        Apple apple = new Apple();
        System.out.println(apple.bbd);
    }
}
```

Apple.java

```java
// Apple in the fruits package
package fruits;

// public class
public class Apple {
    // public variable
    public String bbd = "2023-11-30";
}
```

<hr>

### 3. Using a constructor/method member of the packaged class

#### Steps

1. Make public the target class.

2. Make public the target method/constructor

3. Import package definiton to requester class.

Main.java

```java
// Import fruits package to access apple class
import fruits.Apple;

public class Main {
    public static void main(String[] args) {
        Apple apple = new Apple();
        apple.eat();
    }
}
```

Apple.java
```java
// Apple in the fruits package
package fruits;

// Public class
public class Apple {
    // Public constructor
    public Apple(){
        System.out.println("Constructor call");
    }

    // Public method
    public void eat(){
        System.out.println("eat");
    }
}
```

## What is the Fully Qualified Name?
* The fully qualified name of a class is the name of the class prefixed with the package name.


Main.java

```java
public class Main {
    public static void main(String[] args) {
        // Fully qualified name
        fruits.Apple apple = new fruits.Apple();
        apple.eat();
    }
}
```

Above code equals to below code

```java
// Import fruits package to access apple class
import fruits.Apple;

public class Main {
    public static void main(String[] args) {
        Apple apple = new Apple();
        apple.eat();
    }
}
```

## How package access (`default`) works?

* When we don’t use any keyword explicitly, Java will set a default access to a given class, method or property. 

* The default access modifier is also called package-private, which means that all members are visible within the same package but aren’t accessible from other packages.

### 1. Between to classes of the same package

* You can reach target class with package access

Apple.java

```java
// Apple in the fruits package
package fruits;

class Apple {
    public static void main(String[] args) {
        // Access without import statement
        Banana banana = new Banana();

        // Access without import statement
        System.out.println("BBD: " + banana.bbd);
    }
}
```

Banana.java

```java
// Banana in the fruits package
package fruits;

// Don't need to make public
class Banana {
    // Don't need to make public
    String bbd = "2023-11-30";

    // Don't need to make public
    Banana() {
        System.out.println("Banana constructor...");
    }
}
```

### 2. Between a subclass/superclass in the same package

* You can reach target class with package access

Apple.java

```java
// Apple in the fruits package
package fruits;

// No need to public
class Apple {

    // No need to public
    String BBD;

    public static void main(String[] args) {
        Apple apple = new GreenApple("2023-11-23");
    }
}
```

GreenApple.java

```java
// Green Apple in the fruits package
package fruits;

// GreenApple extends Apple
class GreenApple extends Apple {

    // No need to public
    GreenApple(String bbd) {
        this.BBD = bbd;
    }
}
```

## How protected access (`protected`) works?


### 1. Distinguish protected and package access

* If we declare a method, property or constructor with the protected keyword, we can access the member from the same package (as with package-private access level) and in addition from all subclasses of its class, even if they lie in other packages.

![steps](/images/Advance%20Concepts%20in%20OOP/access_2.png)

* Even though they are in different packages, `A2 class` can access the `B class` because of the protected access.

```
Default Access = Package Private
```

```
Protected Access = Package Private + Subclasses
```

Apple.java
```java
// Apple in the fruits package
package fruits;

// Public for extended by the another class outside the package
public class Apple {
    // Protected for accessed by the subclass or package classes
    protected String BBD;

    // Default for accessed by the packgae classes
    String only_package = "You are in my package";
}
```

GreenApple.java
```java
// Green Apple in the fruits package
package fruits;

// Public for called by main
public class GreenApple {
    // Public for called by main
    public void taste(){
        // It can not accessed by "this" keyword because it is not a subclass
        Apple apple = new Apple();

        // Access with the protected
        apple.BBD = "2023-11-23";
        System.out.println("Eat GreenApple until " + apple.BBD);

        // Access with the default
        System.out.println(apple.only_package);
    }
}
```

RedApple.java

```java
// Import Apple for extend it
import fruits.Apple;

// Extend Apple because it is public and imported by the RedApple
// Public for called by main
public class RedApple extends Apple {
    // Public for called by main
    public void taste(){
        // Access with the protected
        this.BBD = "2023-11-23";
        System.out.println("Eat RedApple until " + BBD);
    }
}
```

Main.java

```java
import fruits.*;

public class Main {
    public static void main(String[] args) {
        RedApple red = new RedApple();
        GreenApple green = new GreenApple();

        red.taste();
        green.taste();
    }
}
```

Output:

```yml
Eat RedApple until 2023-11-23
Eat GreenApple until 2023-11-23
You are in my package
```

### 2. Through inheritance

Apple.java

```java
// Apple in the fruits package
package fruits;

// Public for extended by the another class outside the package
public class Apple {
    // Protected for accessed by the subclass or package classes
    protected String BBD;

    // Protected for accessed by the subclass or package classes
    protected void makeSound(){
        System.out.println("Kıt Kıt Kıt");
    }
}

```
RedApple.java

```java
// Import Apple for extend it
import fruits.Apple;

// Extend Apple because it is public and imported by the RedApple
// Public for called by main
public class RedApple extends Apple {
    // Public for called by main
    public void taste(){
        this.BBD = "2023-11-23";
        System.out.println("Eat RedApple until " + BBD);

        // Through Inheritance
        makeSound();
    }
}
```

Main.java

```java
import fruits.*;

public class Main {
    public static void main(String[] args) {
        RedApple red = new RedApple();
        red.taste();
    }
}
```

Output

```yml
Eat RedApple until 2023-11-23
Kıt Kıt Kıt
```

## Cheat Sheet
![steps](/images/Advance%20Concepts%20in%20OOP/access_3.png)