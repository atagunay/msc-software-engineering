# Collections

Analyze a Genetic Algorithm with respect to the different types of Java Collection

* https://replit.com/@AtaGunay/Genetic-Algorithm-Example

## Reference Map
![Map](https://www.baeldung.com/wp-content/uploads/2022/11/Concrete-Collection-Selection-Diagram.png)

## Resources

* https://stackoverflow.com/questions/21974361/which-java-collection-should-i-use

* https://www.baeldung.com/java-choose-list-set-queue-map

## Java List
According to the reference map, I have chosen the List type because 
* I don't need to key-value pairs,
* There might be duplicate data in the "populations" list
* And I use that list for iteration 

```java
import java.util.ArrayList;

class Population {

    // Array to hold the current population
    // Created instantly (EAGER LOADING)
    private ArrayList<Dna> populations = new ArrayList<>();
}
```

Iteration Example

```java
  // Overloading: Same methods with different parameters
    Population(String target, double mutationRate, int popMax, DnaFactory factory) {
        this.target = target;
        this.mutationRate = mutationRate;
        this.popMax = popMax;

        // Creating populations
        for (int i = 0; i < popMax; i++) {
            populations.add(factory.prepareDna(this.target.length()));
        }
    }
```

### Addition Use Cases

#### GPT Conservation

* https://chat.openai.com/share/beda75cf-eafa-48eb-89ea-684dc2cd8991

<hr>

#### 1. As a particular GA Class

In Java, you can use a List to store elements of any class, including instances of a particular class. To achieve this, you need to specify the type of objects the List will contain by using generics. 

* `Dna` is a GA class, and `populations` is a list that holds several Dnas

```java
public abstract class Dna {
    // ....
}
```

```java
private ArrayList<Dna> populations = new ArrayList<>();
```

Usage for client programmers:

> List is private. Client developer can not access that list

<hr>

#### 2. As a particular GA attribute (/member) of this class

If you want to use a List as a member (attribute) of a particular class, you can declare it as an instance variable within the class.

```java
class Population {
    private ArrayList<Dna> populations = new ArrayList<>();
}
```

Usage for client programmers:

> List is private. Client developer can not access that list

<hr>

#### 3. In the constructor as an internal for a class

Now you can create instances of the Population class with a list of DNAs:

```java
    Population(String target, double mutationRate, int popMax, DnaFactory factory) {
        // Fill populations list
        for (int i = 0; i < popMax; i++) {
            populations.add(factory.prepareDna(this.target.length()));
        }

        // ..
    }
```

Usage for client programmers:

```java
Population pop = new Population("hello", 0.5, 5, new WordDnaFactory());
```

<hr>

#### 4. A method with internal showing how to add/remove (for the chosen attribute)
```java
class Population {
    private ArrayList<Dna> populations = new ArrayList<>();

    // Getter method to retrieve the internal list
    public List<Dna> getMyList() {
        return populations;
    }

    // Method to add a string to the internal list
    public void addElement(Dna dna) {
        populations.add(dna);
    }

    // Method to remove a string from the internal list
    public void removeElement(Dna dna) {
        populations.remove(dna);
    }
}
```

Usage for client programmers

```java
// Create new population class
Population population = new Population();

// Create a new dna for inserting and removing
Dna dna = new Dna();

// Print private populations list
System.out.println(population);

// Add new dna intot the list
population.addElement(dna);

// Remove an element from the list
population.removeElement(dna);
```

