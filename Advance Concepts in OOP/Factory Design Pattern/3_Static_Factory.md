# Static Factory

### References: 
* Head First Design Patterns Book
    * Page: 115

<hr>

Defining a simple factory as a static method is a common technique and is often called a static factory. 

<b>Why use a static method?</b>
<br>
* Because you don’t need to instantiate an object to make use of the create method.

<b>Any Disadvantage?</b>
<br> 
* You can’t subclass and change the behavior of the create method.

### Class Diagram Of The Static Factory
<hr>

```mermaid
    classDiagram
        PizzaStore ..> SimplePizzaFactory : USES AS STATIC
        SimplePizzaFactory *-- Pizza : HAS-A
        Pizza <|-- CheesePizza : IS-A
        Pizza <|-- PepperoniPizza : IS-A
        Pizza <|-- VeggiePizza : IS-A

        class PizzaStore{
            + PizzaStore() : void
            - orderPizza(String type) : Pizza
        }

        class SimplePizzaFactory {
            - Pizza pizza
            + static createPizza(String type) : Pizza
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

### Parallel Hierarchy
![Static Factory Class Diagram](/images/Advance%20Concepts%20in%20OOP/factory_design_pattern_4.png)

### Implementation Of the Factory Method
<hr>

PizzaStore.java
```java
/*
    This is the client of the factory.
    PizzaStore now goes through the SimplePizzaFactory to get instances of pizza.
 */
public class PizzaStore {
    public Pizza orderPizza(String type) {
        Pizza pizza = null;

        // Encapsulate the pizza selection
        pizza = SimplePizzaFactory.createPizza(type);

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
    public static Pizza createPizza(String type){
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
        PizzaStore pizzaStore = new PizzaStore();
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
* https://replit.com/@AtaGunay/StaticFactory

### Full Implementation Class Diagram
![Simple Factory Class Diagram](/images/Advance%20Concepts%20in%20OOP/factory_design_pattern_3.png)

###  How to identify this variant of factory as distinct from another?

* It applies `Simple Factory` approach with the static factory method.

* You can call the factory method without creating a factory

* You can’t subclass and change the behavior of the create method because of the static keyword.