## What are the negatives/drawbacks with the approach to `override a method to do nothing`?

### Example of override a method to do nothing

#### Duck.java

```java
abstract class Duck {
	
    Duck() {
        out.println(" a "+this.getClass().getName());
    }

    void swim() {
        out.println("\t..."+"swims and...");
    }

    void fly(){
        out.println("\t..."+"flys");
    }
}
```

#### Duck.java


