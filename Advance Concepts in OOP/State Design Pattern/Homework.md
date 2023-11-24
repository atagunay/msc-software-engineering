# CA07 Pattern State

## Part 1
> Using the code provided in the Craps00.java example

### Draw a flow chart of the execution of the code provided
* [Flow Chart Link](https://miro.com/app/board/uXjVNXC1cMw=/?share_link_id=862947530755)

### Identify on the diagram exactly where you feel the code is not performing as it should and why

* [Flow Chart Link](https://miro.com/app/board/uXjVNXC1cMw=/?share_link_id=862947530755)

![Alt text](image.png)

1. Now, `playCraps()` and `playPointGame()` methods call same methods (`simulateWinOrLoose()`)

3. Remove `simulateWinOrLoose()` method calling from the `playCraps()` method. 

    *  `playCraps()` called for winning or losing values (2,3,7,11,12)

    * `simulateWinOrLoose()` called for playing point game

    * We should not call `simulateWinOrLoose()` from the `playCraps()`. Because program output should be different.

### Identify changes to get the code to perform as it should: marks awarded for being as precise as possible

* Create a new action for `playCraps()` instead of `simulateWinOrLoose()`

* `playCraps()` should call `simulateWinOrLoose()` (new action) for decide rolled number value is winning value or not

* `playPointGame()` should call `simulateWinOrLoose()` for playing point game

```java
static void simulateWinOrLoose(){
    if( Math.random() > .5){
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
Using the code provided in the `Craps01.java` and `Craps02.java`


### 2.1 - Draw a UML state-diagram

![Alt text](image-1.png)


### 2.2 - Identify on the diagram exactly where you feel the code is not performing as it should and why

* https://github.com/atagunay/casinoCraps-StateDesignPattern/issues/2

* https://github.com/atagunay/casinoCraps-StateDesignPattern/issues/1


### 2.3 - Identify changes to get the code to perform as it should: marks awarded for being as precise as possible

* https://github.com/atagunay/casinoCraps-StateDesignPattern/pull/3

* https://github.com/atagunay/casinoCraps-StateDesignPattern/pull/4





