# Simple Factory

### References: 
* Head First Design Patterns Book
    * Page: 115-125

<hr>

## `FIX Pain Point`: Unable for Open-Closed Principle
What we’re going to do is take the creation code and move it out into another object that is only going to be concerned with creating pizzas.


## Simple Factory

Factories handle the details of object creation. Once we have a SimplePizzaFactory, our orderPizza() method just becomes a client of that object. Any time it needs a pizza it asks the pizza factory to make one.

### Class Diagram Of The Simple Factory
<hr>

```mermaid
    classDiagram
        PizzaStore *-- SimplePizzaFactory : HAS-A
        SimplePizzaFactory *-- Pizza : HAS-A
        Pizza <|-- CheesePizza : IS-A
        Pizza <|-- PepperoniPizza : IS-A
        Pizza <|-- VeggiePizza : IS-A

        class PizzaStore{
            - SimplePizzaFactory factory
            + PizzaStore(SimplePizzaFactory factory) : void
            - orderPizza(String type) : Pizza
        }

        class SimplePizzaFactory {
            - Pizza pizza
            + createPizza(String type) : Pizza
        }

        class Pizza{
            <<abstract>>
            prepare() : void
            bake() : void
            cut() : void
            box() : void
        }

        class CheesePizza
        class PepperoniPizza
        class VeggiePizza
```


### Explaination Of the Class Diagram
<hr>

![Alt text](image-1.png)

### Parallel Hierarchy
![Alt text](image.png)

### Implementation Of the Factory Method
<hr>

PizzaStore.java
```java
/*
    This is the client of the factory.
    PizzaStore now goes through the SimplePizzaFactory to get instances of pizza.
 */

public class PizzaStore {
    SimplePizzaFactory factory;

    public PizzaStore(SimplePizzaFactory factory){
        this.factory = factory;
    }

    public Pizza orderPizza(String type) {
        Pizza pizza = null;

        // Encapsulate the pizza selection
        factory.createPizza(type);

        pizza.prepare();
        pizza.bake();
        pizza.cut();
        pizza.box();

        return pizza;
    }
}
```

SimplePizzaFactory.java
```java
/*
    Factories handle the details of object creation.
    Once we have a SimplePizzaFactory, our orderPizza() method just becomes a client of that object.
    Any time it needs a pizza it asks the pizza factory to make one.
 */

/*
    This is the factory where we create pizzas;
    it should be the only part of our application that refers to concrete Pizza classes
 */

public class SimplePizzaFactory {
    public Pizza createPizza(String type){
        Pizza pizza = null;

        switch (type) {
            case "cheese" -> pizza =  new CheesePizza();
            case "greek" -> pizza =  new GreekPizza();
            case "pepperoni" -> pizza = new PepperoniPizza();
        }

        return pizza;
    }
}
```

Main.java
```java
public class Main {
    public static void main(String[] args) {

        /*
            What we’re going to do is take the creation code and
            Move it out into another object that is only going to be concerned with creating pizzas.
         */

        SimplePizzaFactory factory = new SimplePizzaFactory();
        PizzaStore pizzaStore = new PizzaStore(factory);
        pizzaStore.orderPizza("cheese");
    }
}
```

Output
```yml
CheesePizza : preparing
CheesePizza : baking
CheesePizza : cutting
CheesePizza : boxing
```


### Full Implementation
* https://replit.com/@AtaGunay/SimpleFactory

### Full Implementation Class Diagram
![Alt text](image-10.png)

###  How to identify this variant of factory as distinct from another?

