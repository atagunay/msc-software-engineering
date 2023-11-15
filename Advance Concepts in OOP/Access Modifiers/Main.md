# Access Modifiers

Usefull Links:
* https://www.baeldung.com/java-access-modifiers#:~:text=When%20we%20don't%20use,package%20com.

* https://stackoverflow.com/questions/30384830/determining-fully-qualified-class-name-from-java-lang-string

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

## How package access works?

When we don’t use any keyword explicitly, Java will set a default access to a given class, method or property. The default access modifier is also called package-private, which means that all members are visible within the same package but aren’t accessible from other packages.

### Between to classes of the same package

Apple.java

```java
// Apple in the fruits package
package fruits;

class Apple {
    public static void main(String[] args) {
        // Access without import statement
        Banana banana = new Banana();

        // Access without import statement
        System.out.println("BDD: " + banana.bdd);
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
    String bdd = "2023-11-30";

    // Don't need to make public
    Banana() {
        System.out.println("Banana constructor...");
    }
}
```
