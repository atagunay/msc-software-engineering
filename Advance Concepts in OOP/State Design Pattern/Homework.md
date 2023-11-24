# CA07 Pattern State

## Part 1
> Using the code provided in the Craps00.java example

### Draw a flow chart of the execution of the code provided
* [Flow Chart Link](https://miro.com/app/board/uXjVNXC1cMw=/?share_link_id=862947530755)

### Identify on the diagram exactly where you feel the code is not performing as it should and why

* [Flow Chart Link](https://miro.com/app/board/uXjVNXC1cMw=/?share_link_id=862947530755)

![image](/images/Advance%20Concepts%20in%20OOP/state_1.png)

1. Now, `playCraps()` and `playPointGame()` methods call same methods (`simulateWinOrLoose()`)

3. Remove `simulateWinOrLoose()` method calling from the `playCraps()` method. 

    *  `playCraps()` called for winning or losing values (2,3,7,11,12)

    * `simulateWinOrLoose()` called for playing point game

    * We should not call `simulateWinOrLoose()` from the `playCraps()`. Because program output should be different.

### Identify changes to get the code to perform as it should: marks awarded for being as precise as possible

* Create a new action for `playCraps()` instead of `simulateWinOrLoose()`

* `playCraps()` should call `announceWinOrLoose(rolled)` (new action) for decide rolled number value is winning value or not

* `playPointGame()` should call `simulateWinOrLoose()` for playing point game

```java
static void announceWinOrLoose(int rolled){
    if( rolled == 7 || rolled == 11){
      System.out.println("Simulated Win");
      credits+=5;
    }else{
      System.out.println("Simulated Loose");
      System.out.println("Setting craps to true");
      craps = true; //set craps boolean to true
      System.out.println("game will now end...");
    }
}
```

* Call `announceWinOrLoose(rolled)` insted of `simulateWinOrLoose()``

```java
// add rolled paramter to pass the announceWinOrLoose method
static void playCraps(int rolled)
{
    System.out.println("do - play craps code");
    // old code
    // simulateWinOrLoose();

    // new code
    announceWinOrLoose(rolled);
}
```

* Update calling of the playCraps method

```java
if( playPointGame )
    {
        playPointGame();
    }else{
    // old code
    // playCraps();

    // new code
    playCraps(rolled);
}
```

## Part 2
> Using the code provided in the `Craps01.java` and `Craps02.java`


### 2.1 - Draw a UML state-diagram

![image](/images/Advance%20Concepts%20in%20OOP/state_2.png)


### 2.2 - Identify on the diagram exactly where you feel the code is not performing as it should and why

* https://github.com/atagunay/casinoCraps-StateDesignPattern/issues/2

* https://github.com/atagunay/casinoCraps-StateDesignPattern/issues/1


### 2.3 - Identify changes to get the code to perform as it should: marks awarded for being as precise as possible

* https://github.com/atagunay/casinoCraps-StateDesignPattern/pull/3/files

* https://github.com/atagunay/casinoCraps-StateDesignPattern/pull/4/files


## Part 3

### Analyse the code provided and briefly state whether it is a valid implementation of the State design-pattern.

* What is the State Design Pattern?

The State Pattern allows an object to alter its behavior when its internal state changes. The object will appear to change its class.

> [Head First Design Pattern, Page 410]

* General FLow of State Design Patterns

![image](/images/Advance%20Concepts%20in%20OOP/state_3.png)

* Flow of the existing code

![image](/images/Advance%20Concepts%20in%20OOP/state_4.png)

* Result

Yes, It is a valid state design pattrn implementation

 ### Relate the State design pattern to another pattern we have studied on this course to date.

 > Strategy Design Pattern

 ### State how it is similar and how it is different.

 * Resources:

    * Head First Design Pattern, Page 419

    * https://www.baeldung.com/cs/design-state-pattern-vs-strategy-pattern



 1. Definitons

    * State: Encapsulate state-based behavior and delegate behavior to the current state

    * Strategy: Encapsulate interchangeable behaviors and use delegation to decide which behavior to use

2. Main Idea

    *  The State controls the entire object’s behavior, and it’s reasonable to think that the state will be changed at some point, either by the Context or by the States themselves. 

    * The Strategy helps us to provide a custom behavior to some actions, which might or might not require being changed during the object’s lifetime. Strategies often are set from outside and not aware of each other as they don’t have a natural flow of changes like states have.

3. An Example

    * Let’s take a car as an example. A car can be in different states. The engine can be on, and the engine can be off. The battery can be dead. The tank can be empty, and so on. In all of these states, the car will behave differently. However, a driver can access the car’s interface: steering wheel, pedals, gears, etc. These are the states, and the entire behavior can be considered a combination of the conditions. All the states would provide a distinct behavior, which is a very convenient way to think about it.

    * At the same time, the car can have a gas or a diesel engine. This won’t affect the car’s behaviors or states and can be changed at some point. We can install a diesel engine in a gas car if the gas price goes up and we want to save some money. We can consider this as the Strategy we use to implement our car’s inner behavior. However, it’s not a state of a vehicle. It’s not reasonable to assume that a gas engine is a step in the lifetime of a car, and it will at some point switch to another state of being a diesel car.

4. My Opinion

* Both of them manage with the different behaviours

* In state design pattern, client has more information about working principles than strategy design pattern

* We can change behavior freely in strategy but there are some conditions in state
