# Collections

Analyze a Genetic Algorithm with respect to the different types of Java Collection

* https://replit.com/@AtaGunay/Genetic-Algorithm-Example

## Reference Map
![Map](https://www.baeldung.com/wp-content/uploads/2022/11/Concrete-Collection-Selection-Diagram.png)

## Resources

* https://stackoverflow.com/questions/21974361/which-java-collection-should-i-use

* https://www.baeldung.com/java-choose-list-set-queue-map

* https://chat.openai.com/share/bf5b8c21-7b3b-45b2-8460-0c5bbda6bb92

## Java List

According to the reference map, I have chosen ArrayList:

![image](/images/Advance%20Concepts%20in%20OOP/collections_3.png)

## Usage in the project

```java
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
class Population{
    private ArrayList<Dna> populations = new ArrayList<>();
}
```

Usage for client programmers:

> List is private. Client developer can not access that list

<hr>

#### 2. As a particular GA attribute (/member) of this class

If you want to use a List as a member (attribute) of a particular class, you can declare it as an instance variable within the class.

```java
class Population {
    public ArrayList<Dna> populations = new ArrayList<>();
}
```

Usage for client programmers:

```java
Population pop = new Population("hello", 0.5, 5, new WordDnaFactory());
pop.populations.add(new Word());
```

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
// Dna is an abstract class
// Word is a concrete class type of Dna
Dna dna = new Word();

// Add new dna intot the list
population.addElement(dna);

// Remove an element from the list
population.removeElement(dna);
```

## Java Map
According to the reference map, I have chosen HashMap because:

* I need key-value pairs
* Keys are not enum
* I don't need iteration and travel

![image](/images/Advance%20Concepts%20in%20OOP/collections_1.png)

## Usage in the project

```java
class Population{
    // Init hashmap
    private final HashMap<String,Double> configuration = new HashMap<>();

    // Constructor
    Population(String target, double mutationRate, double popMax, DnaFactory factory) {
        // ..
        configuration.put("MutationRate", mutationRate);
        configuration.put("PopMax", popMax);
    }
}
```

### Addition Use Cases

#### GPT Conservation

* https://chat.openai.com/share/500f41d1-266f-4dab-b481-e4188ee487ff

<hr>

#### 1. As a particular GA Class

* A configuration hashmap will hold some configuration values as key-value pairs

* Keys of the hashmap is a particular class `configuration.java`

```java
// Base class
abstract public class Configuration {
}
```

```java
private final HashMap<Configuration,Double> configuration = new HashMap<>();
```

Usage for client programmers:

> Map is private. Client developer can not access that list

<hr>

#### 2. As a particular GA attribute (/member) of this class

In this example, the configuration hashmap is an attribute of the Population class

```java
// Base class
abstract public class Configuration {
}
```

```java
// Derived class
public class PopMax extends Configuration {
    public double value = 5;
}
```

```java
// Derived class
public class MutationRate extends Configuration{
    public double value = 0.15;
}
```

```java
class Population {
    // Hashmap will hold PopMax and MutationRate
   public HashMap<Configuration,Double> configuration = new HashMap<>();
}
```
Usage for client programmers:

```java
// Create population object
Population pop = new Population("hello", new MutationRate(), new PopMax(), new WordDnaFactory());

// Create a new configuration
MutationRate mutationRate = new mutationRate();

// Update the HashMap
pop.configuration.put(mutationRate, mutationRate.value);
```

<hr>

#### 3. In the constructor as an internal for a class
```java
class Population {
    // Hashmap will hold PopMax and MutationRate
    private final HashMap<Configuration,Double> configuration = new HashMap<>();

      // Constructor  
      Population(String target, MutationRate mutationRate, PopMax popMax, DnaFactory factory) {
        configuration.put(mutationRate, mutationRate.value);
        configuration.put(popMax, popMax.value);

        // ..
    }
}
```

Usage for client programmers:

```java
Population pop = new Population("hello", new MutationRate(), new PopMax(), new WordDnaFactory());
```

<hr>

#### 4. A method with internal showing how to add/remove (for the chosen attribute)
```java
public class Population {
    private final HashMap<Configuration, Double> configuration = new HashMap<>();

    // Method to add a new entry to the HashMap
    public void addConfiguration(Configuration key, Double value) {
        configuration.put(key, value);
    }

    // Method to remove an entry from the HashMap
    public void removeConfiguration(Configuration key) {
        configuration.remove(key);
    }
}
```

Usage for client programmers:

```java
Population pop = new Population("hello", new MutationRate(), new PopMax(), new WordDnaFactory())

// Create a new Configuration object
Configuration mutationRate = new MutationRate();

// Add the new configuration to the HashMap
population.addConfiguration(mutationRate, mutationRate.value);

// Remove the configuration from the HashMap
population.removeConfiguration(mutationRate);
```

## Java Set
According to the reference map, I have chosen HashMap because:

* I don't need to key-value pairs
* I don't travel set according to the insertion order
* I don't use "first in, first out" or "last in, first out."
* There are not any high-priority elements
* There are no duplicate elements
* Values no enum values

![image](/images/Advance%20Concepts%20in%20OOP/collections_2.png)

## Usage in the project

```java
class Population {
    // Set
    private final Set<Configuration> configurations = new HashSet<>();

    // Cnstructor
    Population(String target, MutationRate mutationRate, PopMax popMax, DnaFactory factory) {
        configurations.add(mutationRate);
        configurations.add(popMax);

        // ..
    }
}
```

### Addition Use Cases

#### GPT Conservation

* https://chat.openai.com/share/e8c995a6-f6f4-4d35-aa22-d3a1c44630fb

<hr>

#### 1. As a particular GA Class

* This set holds the elements type of the configuration class

```java
private final Set<Configuration> configurations = new HashSet<>();
```
Usage for client programmers:

> Map is private. Client developer can not access that list

<hr>

#### 2. As a particular GA attribute (/member) of this class

```java
class Population {
    // Set is used by the Population class
    public Set<Configuration> configurations = new HashSet<>();
}
```

Usage for client programmers:

```java
Population pop = new Population("hello", new MutationRate(), new PopMax(), new WordDnaFactory());
pop.configurations.add(new MutationRate());
pop.configurations.add(new PopMax());
```

<hr>

#### 3. In the constructor as an internal for a class

```java
// Base class
abstract public class Configuration {
}
```

```java
// Derived class
public class PopMax extends Configuration {
    public double value = 5;
}
```

```java
// Derived class
public class MutationRate extends Configuration{
    public double value = 0.15;
}
```

```java
class Population {
    // Set
    private final Set<Configuration> configurations = new HashSet<>();

    // Constructor
    Population(String target, MutationRate mutationRate, PopMax popMax, DnaFactory factory) {

        // Set used inside the constructor
        configurations.add(mutationRate);
        configurations.add(popMax);

        // ..
    }
}
```

Usage for client programmers:

```java
Population pop = new Population("hello", new MutationRate(), new PopMax(), new WordDnaFactory());
```

<hr>

#### 4. A method with internal showing how to add/remove (for the chosen attribute)

```java
class Population {
    private final Set<Configuration> configurations = new HashSet<>();

    // Method to add a Configuration to the set
    public void addConfiguration(Configuration config) {
        configurations.add(config);
    }

    // Method to remove a Configuration from the set
    public void removeConfiguration(Configuration config) {
        configurations.remove(config);
    }
}
```

Usage for client programmers:

```java
Population pop = new Population("hello", new MutationRate(), new PopMax(), new WordDnaFactory())

MutationRate mutationRate = new MutationRate()

// Add the new configuration to the HashMap
population.addConfiguration(mutationRate);

// Remove the configuration from the HashMap
population.removeConfiguration(mutationRate);
```