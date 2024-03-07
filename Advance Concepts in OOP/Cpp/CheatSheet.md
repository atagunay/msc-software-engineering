# C++ Cheat Sheet

## Pointer
A pointer, is a variable that stores the memory address as its value.

## Dereference
You can get the value of the pointer variable, by using the * operator (the dereference operator)


```cpp
#include <iostream>

int main() {
  // Declare an integer
  int number = 10;

  // Declare an integer pointer
  // Assign address of number
  int *pnumber = &number;
  
  printf("Address of the pointer: %p\n", &pnumber);

  printf("Pointer holds that address: %p\n", pnumber);
  
  // Dereferencing
  printf("Value of address that halded by the pointer: %d\n", *pnumber);
}
```

## Initializer List

You can initialize instance variables in an initializer list before the rest of the constructor is called.

```cpp
class Foo {
    public:
        Foo();
        int x;
        int y;
};
```

```cpp
// Initializer List
Foo::Foo() : x(0), y(0) {
}
```

Or

```cpp
class Bar {
public:
    Bar();

    int x;
    int y;
};
```

```cpp
// Constructor initializer
Bar::Bar() {
    x = 1;
    y = 1;
}
```

## Arrow Operator (->)
* The arrow operator -> does two things for you: 

* it dereferences the pointer, and then it calls a method on the
instance or accesses a member variable. 

* This is shorthand for saying: `(*myFooInstance).bar();`

```cpp
class Foo {
public:
    Foo();
    void Bar();
    int x;
};
```

```cpp
#include "Foo.h"
#include <stdio.h>

Foo::Foo() {
    x = 0;
}

void Foo::Bar() {
    printf("Bar\n");
}
```

```cpp
#include <iostream>
#include "Foo.h"

int main() {
    Foo *fooPtr = new Foo();
    
    // Same thing if we use default constructor
    // Foo foo;


    std::cout << fooPtr->x << std::endl;
    fooPtr->Bar();
    return 0;
}
```

## References Vs. Pointers

* You can refer to a block of memory with more than one name due to references.

```cpp
#include <iostream>

int main() {
    int myVar = 10;
    int &myRef = myVar;

    printf("myVar: %d\n", myVar);
    printf("Address of myVar: %p\n", &myVar); // SAME
    printf("Address of myRef: %p\n", &myRef); // SAME
    return 0;
}
```

1. They are dereferenced like instances
2. Can never be NULL
3. Can only be assigned to once, at creation. 

> This makes references "safer" than pointers

* Since references can be assigned to only at creation, references that are members of a class must be assigned to in the constructor's initializer list:

```cpp
class Foo {
public:
    Foo(int &x) : myRef(x) {}
    int &myRef;
};
```

```cpp
#include <iostream>
#include "Foo.h"

int main() {
    int x = 5;
    Foo *foo = new Foo(x);

    std::cout << foo->myRef << std::endl;
    return 0;
}
```

## Local Storage

 * Valid only within a certain scope. Local storage is also known as automatic memory or storage on the stack.

 ```cpp
 #include "Foo.h"

int main() {
    int x = 5;
    Foo foo;
    
    return 0;
}
 ```

 ## Global Storage

 * Valid throughout the execution of the program. Global storage is also called the free store, dynamic memory, or storage on the heap.

 ```cpp
 #include <iostream>
 #include "Foo.h"

int main() {
    Foo *foo = new Foo();
    printf("x: %d\n", foo->x);

    return 0;
}
 ```

##  Deallocating memory

 * In Java, you allocate memory for an object using new, and a garbage collector frees the memory automatically when no existing object references it. 
 
 * In C++, you have to be much more responsible than that.

 *  To avoid leaks, you need to keep track of all the memory you have newed and free it when you no longer need it.

 ```cpp
 #include <iostream>
 #include "Foo.h"

int main() {
    Foo *foo = new Foo();
    printf("x: %d\n", foo->x);

    delete foo;
    return 0;
}
 ```

 > Remember that only objects created using new should be deleted with delete! 

 > The following is a good rule of thumb: memory allocated in a constructor should be deallocated in a destructor, and memory allocated in a function should be deallocated before it exits.

 ```cpp
 #include "Bar.h"

class Foo {
public:
    Foo() { barPtr = new Bar(); };
    ~Foo() { delete barPtr; };
private:
    Bar *barPtr;
};
 ```

 ## Managing memory: Parameters

 ```cpp
class Foo {
public:
    Foo() {};

    ~Foo() {};

    void incrementWithValue(int x);

    void incrementWithReference(int &x);

    void incrementWithPointer(int *x);
};
 ```

```cpp
#include "Foo.h"

void Foo::incrementWithValue(int x) {
    x = x + 2;
}

void Foo::incrementWithReference(int &x) {
    x = x + 2;
}

void Foo::incrementWithPointer(int *x) {
    *x = *x + 2;
}
```

 ```cpp
 #include <iostream>
#include "Foo.h"

int main() {
    Foo *foo = new Foo();

    int x = 10;
    int &xRef = x;

    foo->incrementWithPointer(&x);
    foo->incrementWithValue(x);
    foo->incrementWithReference(xRef);

    printf("%d", x);
    return 0;
}
 ```

 ## Return Values

 * if you return a pointer or reference to a variable declared in this manner, and the variable leaves scope at some time, the pointer or reference will point to trash.

 ```cpp
 // EEK! aLocalFooInstance leaves scope and is destroyed!

 Foo& FooFactory::createBadFoo(int a, int b) {
    Foo aLocalFooInstance(a,b); // creates an local instance of the class Foo
    return aLocalFooInstance; // returns a reference to this instance
} 
 ```

Solution:

1. Return a pointer to an instance in global storage
2. Return an actual instance

```cpp
Foo* FooFactory::createFoo(int a, int b) {
return new Foo(a,b); // returns a pointer to an instance of Foo
}

Foo FooFactory::createFoo(int a, int b) {
return Foo(a,b); // returns an instance of Foo
}
```

## Compare C++ and Java with respect to how an Object can come into being, where it can reside in memory while it exists, and how/when an Object is deleted.

1. JAVA

```java
Foo foo = new Foo();
```

* How is an object created?

    * Use "new" keyword and assign to a reference

* Where is an object stored?

    * All objects are allocated on the heap area managed by the JVM 

* How is an object deleted?

    * Java manages memory automatically through garbage collection, and developers do not explicitly deallocate memory.

* When is an object deleted?

    * In most configurations the operating system allocates the heap in advance to be managed by the JVM while the program is running

    * There is no explicit deletion and no memory is given back to the operating system.

    * Once an object is no longer referenced and therefore is not reachable by the application code, the garbage collector removes it and reclaims the unused memory.

2. C++

```cpp
Foo *foo = new Foo();
```


* How is an object created?

    * Use "new" keyword assign to pointer

* Where is an object stored?

    * C++ uses stack and heap but object created with "new" keyword stores on the heap

* How is an object deleted?

    * Objects must be explicitly deleted by the developer using the delete keyword.

* When is an object deleted?

    *  Good rule of thumb: memory allocated in a constructor should be deallocated in a destructor, and memory allocated in a function should be deallocated before it exits.

## Destructor and Virtual Destructor

1. Destrcutor

Destructor is an instance member function that is invoked automatically whenever an object is going to be destroyed. Meaning, a destructor is the last function that is going to be called before an object is destroyed.

* When is the destructor called?

    *  A destructor function is called automatically when the object goes out of scope:

        1. the function ends 
        2. the program ends 
        3. a block containing local variables ends 
        4. a delete operator is called  


```cpp
class Foo {
public:
    Foo();
    ~Foo();
};
```

```cpp
#include "Foo.h"
#include <stdio.h>

Foo::Foo() {
    printf("Constructor...");
}

Foo::~Foo() {
    printf("Destrcutor...");
}
```

```cpp
#include "Foo.h"

int main() {
    Foo foo;
    return 0;
}
```

2. Virtual Destructor

* What is the virtual method?

    * A virtual function (also known as virtual methods) is a member function that is declared within a base class and is re-defined (overridden) by a derived class. When you refer to a derived class object using a pointer or a reference to the base class, you can call a virtual function for that object and execute the derived class’s version of the method.

    * Virtual functions ensure that the correct function is called for an object, regardless of the type of reference (or pointer) used for the function call.

    * They are mainly used to achieve Runtime polymorphism.

    * Functions are declared with a virtual keyword in a base class.

    * The resolving of a function call is done at runtime. 

* What is the Virtual Destructor?

    * Deleting a derived class object using a pointer of base class type that has a non-virtual destructor results in undefined behavior. To correct this situation, the base class should be defined with a virtual destructor. 

```cpp
#include "stdio.h"

class Foo {
public:
    Foo() { printf("Foo Constructor...\n"); };

    virtual ~Foo() { printf("Foo Destructor...\n"); };
};
``` 

```cpp
#include "stdio.h"
#include "Foo.h"

class Bar : public Foo {
public:
    Bar() { printf("Bar constrcutor\n"); };

    ~Bar() { printf("Bar destructor\n"); };
};
```

```cpp
#include "Foo.h"
#include "Bar.h"

int main() {
    Bar *bar = new Bar();
    Foo *foo = bar;
    delete foo;

    return 0;
}
```
## Super Keyword

In c++ you can not use super keyword because C++ has multiple inheritance

```cpp
class Bar : public Foo, public Baz{
public:
    Bar() {};
};
```

But you can call super functions like this

```cpp
#include "Foo.h"

class Bar : public Foo {
public:
    Bar() {};

    void doSomething();
};
```

```cpp
class Foo {
public:
    Foo() {};

    void doSomething();
};
```

```cpp
#include "Bar.h"
#include "stdio.h"
// dont need to include foo because we added in bar.h

void Bar::doSomething() {
    printf("Bar doSomething...\n");
    Foo::doSomething();
}

void Foo::doSomething() {
    printf("Foo doSomething...\n");
}
```

```cpp
#include "Bar.h"

int main() {
    Bar *bar = new Bar();
    bar->doSomething();
    return 0;
}
```

##  Copy Constructor

A copy constructor is a member function that initializes an object using another object of the same class. In simple terms, a constructor which creates an object by initializing it with an object of the same class, which has been created previously is known as a copy constructor.  

```cpp
class Bar {
public:
    Bar(const Bar &copClass) { x = copClass.x; };
    Bar() {};
    int x;
};
```

```cpp
#include "Bar.h"
#include <stdio.h>

int main() {
    Bar *bar = new Bar();
    bar->x = 10;

    Bar *bar2 = new Bar(*bar);
    printf("bar2->x = %d\n", bar2->x);
    
    return 0;
}
```

## Copy Assignment Operator

Usage:

* The copy constructor is used for creating a new object as a copy of an existing object during the object's initialization.

* The copy assignment operator is used for assigning the contents of an existing object to another existing object after both have been initialized.

When they are called:

* The copy constructor is called automatically when a new object is created as a copy of another object, for example, during object initialization or when an object is passed by value to a function.

* The copy assignment operator is called explicitly when you use the assignment operator (=) between two objects.

```cpp
MyClass& operator=(const MyClass& other) {
    if (this != &other) {
        // Implementation to copy 'other' to 'this'
    }
    return *this;
}
```

```cpp
int main() {
    // Creating objects
    MyClass obj1;
    obj1.displayData(); // Output: Data: 0

    MyClass obj2;
    obj2.displayData(); // Output: Data: 0

    // Using the copy assignment operator
    obj2 = obj1;
    obj2.displayData(); // Output: Data: 0

    return 0;
}
```

## Shallow Copy Vs Deep Copy

https://chat.openai.com/share/306b1cbe-f3e8-456d-9928-9832bf6c1cbc

![Alt text](image.png)


## Collections Between C++ and Java

List

```java
import java.util.*;


class Main {
  public static void main(String[] args) {
    String fruit;
    List<String> fruits = new ArrayList<>();
    
    fruits.add("Apple");
    fruits.add("Banana");

    System.out.println(fruits.size());
    
    fruit = fruits.get(0);
    System.out.println(fruit);

    fruits.remove(0);
    fruit = fruits.get(0);
    System.out.println(fruit);
    System.out.println(fruits.size());
  }
}
```

```cpp
#include <iostream>
#include <vector>

int main() {
    std::string fruit;
    std::vector<std::string> fruits;

    fruits.push_back("Apple");
    fruits.push_back("Banana");

    std::cout << fruits.size() << std::endl;

    fruit = fruits[0];
    std::cout << fruit << std::endl;

    fruits.erase(fruits.begin());
    fruit = fruits[0];
    std::cout << fruit << std::endl;
    std::cout << fruits.size() << std::endl;

    return 0;
}

```

Hash Map

```java
import java.util.*;


class Main {
  public static void main(String[] args) {
    Map<String, Integer> classes = new HashMap<String, Integer>();
    classes.put("Math", 90);
    classes.put("English", 80);

    System.out.println(classes.size());
    System.out.println(classes.get("Math"));
    classes.remove("Math");
    System.out.println(classes.size());
  }
}
```

```cpp
#include <iostream>
#include <unordered_map>

int main() {
    std::unordered_map<std::string, int> classes;
    classes["Math"] = 90;
    classes["English"] = 80;

    std::cout << classes.size() << std::endl;
    std::cout << classes["Math"] << std::endl;
    classes.erase("Math");
    std::cout << classes.size() << std::endl;

    return 0;
}

```

## Deadly Diamond Of Death

https://chat.openai.com/share/7d3114d4-8eff-41a8-a2dc-6f917454b1e4

## Generics

https://chat.openai.com/share/967d825c-dae8-4370-a328-667f16ec7e0c