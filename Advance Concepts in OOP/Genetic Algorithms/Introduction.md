# Introdcution To Genetic Algorithm

## Useful Demo Website For Visualization
1. [Car Game](https://rednuht.org/genetic_cars_2/)

## Useful Links
1. [Chapter 9. Evolutionary Computing](https://nature-of-code-2nd-edition.netlify.app/genetic-algorithms/)
2. [Chat GPT Conservation](https://chat.openai.com/share/2aa12794-f740-44b0-bd18-a4d909ac456e)
3. [Youtube Playlist](https://youtube.com/playlist?list=PLRqwX-V7Uu6bJM3VgzjNV5YxVxUwzALHV&si=71nCDzXElK_Ushwd)

## Darwinian Natural Selection

### Heredity
There must be a mechanism that allows “parent” creatures in one generation to pass their traits down to “child” creatures in the next generation.


### Variation
There must be a variety of traits present in the population of creatures or a means with which to introduce variation for evolution to take place. Imagine if there were a population of beetles in which all the beetles were exactly the same: same color, same size, same wingspan, same everything. Without any variety in the population, the children would always be identical to the parents and to each other. New combinations of traits can never occur, and nothing can evolve.


### Selection
There must be a mechanism by which some creatures have the opportunity to be parents and pass on their genetic information, while others don’t. This is commonly referred to as “survival of the fittest.” Take, for example, a population of gazelles that are chased by lions. The faster gazelles have a better chance of escaping the lions, increasing their chances of living longer, reproducing, and passing on their genetic information to offspring. The term fittest can be misleading, however. It’s often thought to mean biggest, fastest, or strongest, but while it can sometimes encompass physical attributes like size, speed, or strength, it doesn’t have to. The core of natural selection lies in whatever traits best suit an organism’s environment and increase its likelihood of survival and ultimately reproduction. Instead of asserting superiority, “fittest” can be better understood as “able to reproduce.” Take the Dolania americana (also known as the American sand-burrowing mayfly), which is believed to have the shortest lifespan of any insect. An adult female lives for only five minutes, but as long as it has managed to deposit its egg in the water, it will pass its genetic information to the next generation. For the typing cats, a more “fit” cat, one that I will assign as more likely to reproduce, is one that has typed more characters present in a given phrase of Shakespeare.

## An Implementation Example

### Problem Definition
> Create "`unicorn`" word with genetic algorithm

### 1. Create a Random Population of N Elements [Variation]
```md
1. unijorm
2. pancake
3. aaaaaah
4. popcorn
```

### 2. Calculate Fitness For N Elements [Selection]

<u>Fitness Function:</u> Number of the characters that match the target phrase

```md
1. unijorm: 5 
2. pancake: 1
3. aaaaaah: 0
4. popcorn: 4
```

### 3. Reproduction / Selection
Picking the parents
```md
1. unijorm
2. popcorn
```

### 4. Crossover
```
[uni|jorm] || [pop|corn]            
         
         unicorn
```

### 5. Mutation
If we can not reach the answer, we should change the varitions of the children

## Practice Example
[Replit-Link](https://replit.com/@AtaGunay/Genetic-Algorithm-Example)

### Problem Definition
> Create "`hello`" word with genetic algorithm

![image](/images/Advance%20Concepts%20in%20OOP/genetic_1.png)
![image](/images/Advance%20Concepts%20in%20OOP/genetic_2.png)

### Main Class
```java
class Main {
  public static void main(String[] args) {
    // USAGE OF CLIENT PROGRAMMER
    // Calling constructor
    Population pop = new Population("hello", 0.5, 5);
    
    do {
      // Calculate fitness
      pop.calcFitness();  

      // Generate mating pool
      pop.naturalSelection();

      //Create next generation
      pop.generate();
      
      // Print population
      pop.printPopulation();
      
    } while(pop.evaluate() == false);
  }
}
```

### Population Class
```java
import java.util.ArrayList;
import java.util.Random;

class Population{
  // Variables set as private because anybody should not reach outside of the class
  private String target;
  private double mutationRate;
  private int popmax;

  // Array to hold the current population
  // Created instantly (EAGER LOADING)
  private ArrayList<Dna> populations = new ArrayList<Dna>(); 

  // ArrayList which we will use for our "mating pool"
  // Created instantly (EAGER LOADING)
  private ArrayList<Dna> matingPool = new ArrayList<Dna>(); 

  // Zero arg Constructor
  Population(){
    // An example of DRY (Don't Repeat Yourself)
    // this.target = target;
    // this.mutationRate = mutationRate;
    // this.popmax = popmax;
    
    // Population("Hello World", 0.5, 500);
    this("Hello World", 0.5, 500);
  }

  // Overloading: Same methods with different parameters
  Population(String target, double mutationRate, int popmax){
    this.target = target;
    this.mutationRate = mutationRate;
    this.popmax = popmax;
    
    // Creating populations
    for(int i = 0; i < popmax; i++){
      populations.add(new Dna(this.target.length()));
    }
  }

  // Getter method
  // An example of Encapsulation
  public String getTarget(){
    // We can manipule the data
    // Data binding
    return this.target;
  }

  // Getter method
  // An example of Encapsulation
  public double getMutationRate(){
    // We can manipule the data
    // Data binding
    return this.mutationRate;
  }

  // Getter method
  // An example of Encapsulation
  public int getPopmax(){
    // We can manipule the data
    // Data binding
    return this.popmax;
  }

  // Fill our fitness array with a value for every member of the population
  public void calcFitness(){
    for(int i = 0; i < populations.size(); i++){
      // Call Dna calcFitness() method
      populations.get(i).calcFitness(target);
    }
  }

  // Generate a mating pool
  public void naturalSelection() {
    // Based on fitness, each member will get added to the mating pool a certain number of times
    // a higher fitness = more entries to mating pool = more likely to be picked as a parent
    // a lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for(int i = 0; i < populations.size(); i++){
      float fitness = populations.get(i).getFitness();
      int count = (int)Math.floor(fitness * popmax);
      for(int j = 0; j < count; j++){
        matingPool.add(populations.get(i));
      }
    }
  }

  // Create a new generation
  public void generate(){
    // Refill the population with children from the mating pool
    Random rand = new Random();
    for (int i = 0; i < populations.size(); i++) {
      Dna parent_1 = matingPool.get(rand.nextInt(matingPool.size()));
      Dna parent_2 = matingPool.get(rand.nextInt(matingPool.size()));
      Dna child = parent_1.crossover(parent_2);
      child.mutate(mutationRate);
      populations.set(i, child);
    }
  }

  public void printPopulation(){
    System.out.println("Population:");
    for(int i = 0; i < populations.size(); i++){
      System.out.println(populations.get(i).getGenes());
    }
  }

  // // Calculate the result
  public boolean evaluate(){
    for(int i = 0; i < populations.size(); i++){
      boolean correct = true;
      
      for (int j = 0; j < target.length(); j++){
        if (populations.get(i).getGenes().get(j).charAt(0) != target.charAt(j)){
          correct = false;
          break;
        }
      }

      if (correct == true){
        return true;
      }
    }
    
    return false;
  }
  
}
```

###  Dna Class

```java
import java.util.ArrayList;
import java.util.Random;

//   Functionality:
//      -- convert DNA into a string
//      -- calculate DNA's "fitness"
//      -- mate DNA with another set of DNA
//      -- mutate DNA

class Dna{
  // Randomly select a point to split the genes
  // Variables set as private because anybody should not reach outside of the class
  private Random rand = new Random();
  private ArrayList<String> genes = new ArrayList<String>();
  private float fitness;

  // Constructor (makes a random DNA)
  Dna(int number){
    for (int i = 0; i < number; i++){
      genes.add(newChar());
    }
  }

  // Getter method
  // An example of Encapsulation
  public float getFitness(){
    return this.fitness;
  }

  public ArrayList<String> getGenes(){
    return this.genes;
  }

  private String newChar(){
    int min = 97;   // ASCII number
    int max = 123;  // ASCII number
    int c = rand.nextInt(max-min) + min;
    
    return Character.toString((char)c);
  }

  // Fitness function
  public void calcFitness(String target){
    int score = 0;
    for(int i = 0; i < genes.size(); i++){
      if (genes.get(i).charAt(0) == target.charAt(i)){
        score = score + 1;
      }

      fitness = score / (float)target.length();
    }
  }

  // Crossover
  public Dna crossover(Dna partner){
    // A new child
    Dna child = new Dna(genes.size());
    
    // Pick a midpoint
    int midpoint = rand.nextInt(genes.size());
    
    // Half from one, half from the other
    for (int i = 0; i < genes.size(); i++){
      if (i < midpoint){
        child.genes.set(i, genes.get(i));
      }
      else {
        child.genes.set(i, partner.genes.get(i));
      }
    }

    return child;
  }

  public void mutate(double mutationRate){
    for (int i = 0; i < genes.size(); i++) {
      if (rand.nextFloat() < mutationRate){
        genes.set(i, newChar());
      }
    }
  }
}
```

### Example Output
```java
[v, m, a, w, o]
[o, c, a, e, o]
[j, t, z, g, w]
[i, e, s, j, s]
[l, s, l, u, o]
Population:
[k, e, z, e, e]
[j, e, x, b, e]
[w, l, l, e, l]
[z, a, l, l, s]
[j, d, i, j, w]
Population:
[g, n, q, h, o]
[l, d, h, x, o]
[x, e, d, k, h]
[n, e, m, k, v]
[p, e, j, m, s]
Population:
[u, e, x, j, z]
[h, c, z, l, u]
[d, e, b, c, z]
[i, m, n, t, g]
[m, e, i, v, x]
Population:
[q, e, f, w, e]
[v, r, j, j, r]
[l, e, f, a, o]
[h, e, v, p, i]
[y, t, n, f, w]
Population:
[w, u, l, q, o]
[t, n, i, v, o]
[v, w, n, x, t]
[h, f, x, r, f]
[u, e, c, b, f]
Population:
[n, v, o, y, o]
[q, z, b, j, a]
[k, g, y, z, c]
[l, i, u, e, o]
[h, n, p, l, b]
Population:
[h, q, r, u, h]
[g, g, s, y, o]
[y, f, j, a, d]
[k, c, m, p, o]
[t, q, p, j, e]
Population:
[v, s, k, u, n]
[j, e, l, l, s]
[h, w, l, r, t]
[e, r, l, l, o]
[x, w, s, u, p]
Population:
[m, v, b, n, i]
[q, r, l, l, i]
[u, u, e, l, z]
[s, e, z, d, o]
[p, t, g, l, p]
Population:
[c, s, y, l, b]
[l, d, m, j, o]
[c, e, h, s, a]
[w, e, e, i, p]
[p, f, l, a, e]
Population:
[y, d, r, w, n]
[u, h, l, j, m]
[f, q, h, l, f]
[j, h, u, b, z]
[y, m, l, w, w]
Population:
[a, h, o, l, g]
[h, e, q, l, k]
[y, g, i, p, p]
[l, h, n, l, l]
[i, w, j, s, w]
Population:
[b, e, c, i, d]
[n, z, z, i, j]
[p, r, i, q, o]
[z, t, s, f, n]
[h, w, o, r, v]
Population:
[f, e, k, p, x]
[o, j, a, d, k]
[z, e, i, g, z]
[o, d, z, q, j]
[j, o, h, l, l]
Population:
[k, z, s, g, o]
[k, i, s, l, r]
[r, e, c, a, j]
[s, e, k, u, o]
[b, z, y, g, e]
Population:
[v, j, u, b, i]
[m, e, f, i, z]
[u, s, t, g, j]
[k, x, a, j, t]
[j, e, p, l, t]
Population:
[v, s, l, m, q]
[c, n, l, s, o]
[p, e, e, m, b]
[m, l, l, h, b]
[e, s, g, a, o]
Population:
[h, d, n, p, o]
[h, l, l, a, q]
[c, u, x, l, y]
[m, d, n, x, f]
[h, h, o, a, z]
Population:
[s, e, t, f, i]
[e, r, d, x, z]
[l, s, l, s, p]
[t, g, k, q, r]
[u, u, f, x, a]
Population:
[n, v, k, v, i]
[h, z, z, l, g]
[j, b, f, l, z]
[r, x, h, j, y]
[u, v, d, s, v]
Population:
[w, e, f, j, v]
[w, r, n, b, x]
[k, e, b, x, e]
[h, e, z, t, j]
[w, w, g, e, i]
Population:
[v, e, z, t, p]
[j, e, m, r, b]
[g, d, v, l, i]
[z, e, u, y, i]
[c, n, l, s, s]
Population:
[h, n, l, l, w]
[y, w, d, t, u]
[d, y, f, z, p]
[q, e, e, t, o]
[i, e, t, l, i]
Population:
[d, d, n, p, o]
[z, d, a, j, p]
[h, e, s, f, i]
[a, v, z, h, c]
[d, x, g, u, w]
Population:
[z, b, l, p, l]
[j, e, q, m, c]
[p, c, e, f, e]
[h, q, h, i, t]
[c, f, t, p, u]
Population:
[j, v, j, l, q]
[d, e, p, a, o]
[w, p, h, l, i]
[v, j, b, s, o]
[e, p, w, s, d]
Population:
[i, p, v, l, u]
[r, e, s, p, i]
[e, e, q, w, c]
[y, g, a, i, o]
[q, k, j, a, o]
Population:
[e, s, l, v, e]
[j, g, x, y, k]
[p, e, l, y, q]
[z, i, w, i, o]
[t, s, r, l, o]
Population:
[c, u, n, c, b]
[h, v, x, l, o]
[x, y, k, p, b]
[s, l, t, c, z]
[w, u, b, t, j]
Population:
[u, z, d, b, i]
[k, u, z, k, k]
[c, i, l, x, v]
[z, a, t, l, p]
[m, r, t, s, z]
Population:
[n, n, j, z, i]
[b, r, t, p, o]
[y, k, h, e, h]
[b, n, g, l, r]
[l, r, u, v, p]
Population:
[u, e, a, t, w]
[j, k, n, r, j]
[h, d, v, t, a]
[j, e, l, l, z]
[y, e, v, l, u]
Population:
[g, p, h, l, f]
[h, f, e, y, o]
[f, o, p, e, m]
[v, q, d, i, f]
[l, x, i, x, f]
Population:
[l, x, a, n, m]
[l, n, e, a, c]
[t, x, l, h, r]
[t, z, u, e, e]
[u, j, v, l, f]
Population:
[l, m, l, y, o]
[x, r, q, s, i]
[f, a, h, k, r]
[b, m, y, l, f]
[n, e, d, o, y]
Population:
[e, e, z, o, o]
[i, d, t, f, q]
[g, d, e, y, k]
[b, j, p, o, x]
[v, h, z, l, c]
Population:
[r, n, x, d, f]
[n, m, i, g, a]
[z, l, l, r, o]
[h, o, q, o, e]
[z, w, o, c, a]
Population:
[t, x, d, u, o]
[i, s, p, l, x]
[b, y, a, g, b]
[p, a, q, e, b]
[u, y, m, f, g]
Population:
[w, j, l, g, h]
[l, e, j, i, o]
[g, h, a, k, o]
[f, a, d, d, t]
[k, a, t, l, t]
Population:
[e, e, n, d, x]
[b, o, j, j, q]
[h, e, o, l, o]
[e, e, f, l, a]
[o, e, l, y, s]
Population:
[i, e, p, u, q]
[k, k, y, n, t]
[i, q, b, d, o]
[h, x, f, l, k]
[u, h, l, q, e]
Population:
[y, u, y, o, y]
[h, a, a, k, f]
[y, e, h, j, j]
[n, l, l, y, j]
[w, j, l, p, o]
Population:
[s, q, b, a, u]
[g, e, z, k, f]
[c, e, c, l, f]
[c, h, j, l, x]
[h, w, w, l, o]
Population:
[u, e, x, a, a]
[w, e, e, f, p]
[h, t, l, h, o]
[g, q, i, o, i]
[m, h, r, t, u]
Population:
[b, e, i, h, i]
[s, e, y, t, o]
[d, n, d, l, t]
[d, e, y, r, h]
[u, e, k, u, g]
Population:
[v, a, q, i, k]
[s, g, e, i, o]
[c, m, y, l, o]
[k, n, p, o, v]
[s, e, f, l, i]
Population:
[z, g, l, y, o]
[n, v, t, w, b]
[p, w, e, f, q]
[o, e, z, y, a]
[w, n, v, m, o]
Population:
[z, t, m, w, n]
[h, z, p, l, g]
[q, e, v, u, o]
[v, e, n, y, s]
[p, e, t, y, y]
Population:
[g, m, f, a, a]
[h, v, h, q, z]
[j, e, q, t, k]
[c, l, c, x, c]
[l, o, l, l, f]
Population:
[p, g, l, m, c]
[e, e, s, i, j]
[a, w, b, p, r]
[v, z, h, l, t]
[h, v, r, c, o]
Population:
[u, w, q, e, o]
[i, n, b, e, o]
[p, e, o, l, p]
[i, e, i, g, j]
[u, c, f, l, p]
Population:
[i, e, l, l, h]
[h, d, m, e, u]
[h, g, l, i, m]
[t, h, r, l, u]
[i, p, q, m, o]
Population:
[h, u, e, l, b]
[h, z, m, f, i]
[k, k, o, h, v]
[n, e, j, f, x]
[s, f, a, g, z]
Population:
[t, e, t, y, o]
[p, f, e, l, v]
[o, e, f, y, u]
[p, n, m, l, s]
[r, e, i, l, g]
Population:
[l, e, z, x, t]
[s, d, k, l, j]
[t, e, n, c, u]
[j, q, q, l, g]
[a, n, c, t, u]
Population:
[g, l, f, l, k]
[e, e, i, p, o]
[k, e, x, u, n]
[c, e, l, m, x]
[y, e, r, z, e]
Population:
[g, q, z, l, w]
[p, z, n, a, j]
[c, q, w, c, t]
[t, e, l, f, s]
[m, e, b, y, i]
Population:
[h, p, o, t, i]
[l, j, v, l, o]
[k, e, j, n, r]
[n, c, z, q, m]
[h, o, a, s, i]
Population:
[n, e, r, z, x]
[f, w, w, z, n]
[e, e, z, k, h]
[f, s, n, l, n]
[n, k, b, n, v]
Population:
[g, e, e, f, o]
[t, k, z, s, i]
[h, t, p, n, n]
[j, r, d, d, p]
[k, e, k, x, r]
Population:
[x, q, b, s, q]
[t, j, e, s, r]
[t, d, e, w, z]
[y, m, w, z, r]
[e, p, k, a, j]
Population:
[q, e, l, j, a]
[w, e, t, s, t]
[e, r, b, l, b]
[d, d, a, x, z]
[l, e, i, r, o]
Population:
[a, h, m, d, c]
[o, e, b, k, o]
[w, k, i, l, m]
[g, e, q, r, o]
[d, u, e, b, o]
Population:
[s, t, t, h, z]
[h, l, b, i, q]
[i, w, o, r, o]
[i, a, b, p, a]
[h, v, k, c, g]
Population:
[k, e, g, n, q]
[c, e, v, f, a]
[j, e, d, j, x]
[k, i, n, d, e]
[i, e, y, k, i]
Population:
[l, e, s, l, f]
[g, p, y, v, a]
[c, e, h, l, j]
[e, q, x, n, t]
[c, b, v, e, g]
Population:
[x, r, q, l, o]
[z, d, r, l, x]
[g, n, k, r, w]
[b, v, e, z, b]
[a, y, o, w, s]
Population:
[o, d, y, n, w]
[t, l, m, m, h]
[h, e, z, o, u]
[j, e, s, v, g]
[f, e, z, w, x]
Population:
[p, e, s, k, t]
[h, y, h, g, f]
[z, e, d, n, x]
[r, v, s, g, r]
[h, b, v, l, o]
Population:
[h, u, a, l, r]
[i, r, q, b, a]
[a, n, s, l, b]
[i, z, w, y, o]
[u, e, g, a, p]
Population:
[l, c, q, k, x]
[s, a, o, e, j]
[j, e, j, z, q]
[y, e, o, v, o]
[z, e, q, u, s]
Population:
[p, y, o, l, c]
[b, z, d, u, v]
[k, y, v, h, x]
[o, i, l, a, s]
[k, k, m, k, o]
Population:
[n, z, l, t, o]
[j, e, k, o, g]
[e, f, i, c, v]
[h, o, z, d, u]
[j, e, l, q, j]
Population:
[l, o, c, l, w]
[k, e, z, f, s]
[w, n, j, u, o]
[x, l, m, m, l]
[l, p, x, o, j]
Population:
[p, e, f, n, s]
[r, n, a, e, l]
[h, c, x, e, z]
[h, h, r, r, s]
[f, n, r, z, b]
Population:
[h, a, l, b, s]
[k, l, c, e, f]
[c, v, c, l, j]
[g, q, e, z, m]
[e, z, d, y, o]
Population:
[l, f, h, m, v]
[g, p, t, e, c]
[h, a, l, q, s]
[e, s, t, d, k]
[f, d, u, a, j]
Population:
[m, o, l, h, x]
[g, u, g, j, m]
[q, l, h, k, c]
[g, g, h, c, o]
[a, e, o, h, f]
Population:
[l, e, d, a, z]
[a, u, l, v, k]
[p, e, o, k, o]
[a, l, h, l, o]
[o, a, e, l, d]
Population:
[d, m, w, p, v]
[e, b, l, x, n]
[c, q, l, x, f]
[k, t, v, a, q]
[h, h, l, y, v]
Population:
[k, g, p, x, i]
[r, e, w, x, h]
[u, k, m, i, u]
[x, z, s, l, e]
[p, e, d, p, t]
Population:
[o, e, d, l, f]
[w, q, r, q, o]
[r, e, s, l, g]
[h, z, n, a, z]
[r, k, z, e, k]
Population:
[v, p, l, k, g]
[s, s, v, v, n]
[u, r, r, y, t]
[f, i, c, b, v]
[k, e, a, o, j]
Population:
[u, x, k, p, j]
[u, n, q, e, o]
[k, v, a, i, p]
[z, d, l, s, y]
[n, u, c, q, d]
Population:
[k, k, l, h, f]
[e, x, n, t, a]
[i, g, l, c, d]
[a, s, q, l, d]
[b, e, z, f, t]
Population:
[t, h, p, c, j]
[d, e, h, l, b]
[r, s, j, l, o]
[t, a, x, s, l]
[u, e, o, q, o]
Population:
[u, y, o, h, w]
[h, r, z, v, h]
[h, t, k, g, m]
[n, e, v, k, k]
[a, e, j, l, w]
Population:
[h, f, p, f, t]
[y, b, y, z, b]
[y, z, x, n, a]
[i, y, p, f, x]
[b, m, k, l, o]
Population:
[k, o, l, d, o]
[k, w, l, p, s]
[k, z, j, o, o]
[h, b, q, l, b]
[o, e, v, i, v]
Population:
[t, l, d, a, a]
[l, t, m, l, g]
[y, t, j, m, m]
[m, e, j, x, p]
[s, m, i, h, x]
Population:
[n, l, c, t, x]
[h, o, q, a, b]
[u, r, k, z, m]
[e, e, l, o, v]
[h, v, i, l, f]
Population:
[c, e, h, l, m]
[w, a, f, e, t]
[q, e, b, z, o]
[c, p, q, i, f]
[s, e, y, a, g]
Population:
[o, f, w, x, o]
[r, e, e, e, o]
[s, e, p, h, u]
[r, e, e, m, f]
[x, w, h, l, c]
Population:
[f, b, f, n, z]
[s, e, r, l, o]
[c, p, u, y, w]
[d, e, g, d, h]
[w, e, y, n, p]
Population:
[a, d, t, k, u]
[w, h, t, l, l]
[o, x, g, y, c]
[g, h, m, j, i]
[d, q, b, h, q]
Population:
[k, e, o, f, j]
[h, q, h, x, p]
[u, y, g, v, b]
[e, u, a, j, v]
[s, g, r, n, m]
Population:
[u, e, t, e, f]
[p, e, g, v, n]
[o, m, f, v, s]
[x, j, v, e, l]
[s, h, v, l, e]
Population:
[w, q, a, z, e]
[h, c, a, r, o]
[t, e, q, k, p]
[g, e, f, k, o]
[y, e, b, h, l]
Population:
[w, g, z, d, i]
[s, e, x, z, o]
[i, e, a, q, f]
[s, m, t, l, q]
[d, n, w, h, l]
Population:
[i, l, a, i, k]
[n, l, e, v, a]
[l, e, p, x, o]
[h, x, d, g, v]
[v, i, u, x, t]
Population:
[j, y, q, u, q]
[r, s, l, l, a]
[t, e, k, v, o]
[s, q, n, v, o]
[h, v, f, r, w]
Population:
[u, s, j, r, k]
[p, i, q, j, h]
[h, h, g, k, v]
[n, t, t, e, o]
[v, e, f, l, q]
Population:
[h, h, t, k, j]
[r, d, l, v, b]
[s, e, v, z, t]
[n, w, m, g, u]
[u, n, o, j, s]
Population:
[n, b, o, t, u]
[b, k, g, l, w]
[w, w, k, o, z]
[l, e, l, i, n]
[d, h, i, l, a]
Population:
[h, b, h, x, o]
[v, p, z, b, k]
[p, j, z, h, j]
[n, r, l, g, r]
[f, c, k, r, k]
Population:
[w, e, y, n, o]
[h, n, l, y, z]
[e, e, d, q, o]
[t, y, v, p, k]
[r, l, h, m, p]
Population:
[n, y, l, w, g]
[b, e, l, t, p]
[j, c, g, l, y]
[s, p, n, v, l]
[l, w, g, l, o]
Population:
[h, q, p, b, g]
[o, v, v, w, o]
[e, u, o, e, n]
[m, i, l, g, i]
[h, d, e, l, c]
Population:
[w, i, s, k, w]
[k, q, j, t, i]
[c, d, l, h, l]
[u, n, a, g, y]
[j, w, q, e, r]
Population:
[u, o, t, j, g]
[o, e, b, l, s]
[g, p, l, a, s]
[i, e, p, x, d]
[l, p, p, p, x]
Population:
[y, m, l, z, h]
[m, e, e, c, k]
[y, k, j, l, w]
[s, n, h, c, i]
[h, e, r, l, t]
Population:
[p, q, t, w, r]
[q, b, n, f, z]
[z, h, x, p, y]
[h, i, x, j, i]
[u, y, m, l, e]
Population:
[i, e, h, e, p]
[r, e, f, w, v]
[g, e, j, y, q]
[o, m, o, l, k]
[n, e, j, a, m]
Population:
[i, q, u, l, w]
[l, n, z, l, y]
[l, e, i, q, o]
[j, u, w, d, d]
[s, v, w, e, h]
Population:
[h, h, q, h, b]
[v, g, o, w, l]
[w, z, z, b, o]
[w, q, b, y, s]
[y, m, z, m, a]
Population:
[v, o, p, p, a]
[f, y, x, s, h]
[r, e, j, t, u]
[g, e, r, l, o]
[y, i, o, a, o]
Population:
[h, e, e, t, x]
[t, e, q, g, c]
[e, o, j, g, o]
[j, e, j, l, c]
[z, q, e, l, p]
Population:
[h, e, y, i, y]
[g, f, y, m, k]
[r, m, y, j, q]
[g, d, i, x, e]
[r, e, o, r, v]
Population:
[f, e, g, w, j]
[h, m, j, s, o]
[h, e, n, c, k]
[y, b, q, y, o]
[r, i, l, n, r]
Population:
[r, m, f, c, z]
[e, l, w, k, o]
[y, e, h, q, z]
[i, t, h, l, o]
[y, l, l, b, u]
Population:
[h, a, y, e, k]
[j, l, t, j, y]
[a, e, d, f, l]
[h, q, j, f, o]
[h, i, p, q, z]
Population:
[r, h, g, f, o]
[z, s, e, l, a]
[d, c, m, l, i]
[g, e, m, l, w]
[f, y, i, q, o]
Population:
[n, s, t, n, o]
[y, x, o, a, z]
[p, z, o, f, v]
[g, e, t, c, g]
[w, f, k, u, x]
Population:
[o, p, l, x, z]
[e, q, k, h, o]
[b, x, l, v, n]
[m, e, l, v, i]
[e, x, l, z, e]
Population:
[d, h, m, s, z]
[y, e, h, f, u]
[h, g, l, y, u]
[p, e, g, o, o]
[h, e, q, o, r]
Population:
[f, p, w, v, t]
[p, g, h, x, o]
[y, b, h, b, j]
[h, q, p, s, b]
[f, f, w, x, v]
Population:
[n, u, x, w, u]
[o, b, i, l, t]
[h, e, z, q, z]
[d, n, j, j, r]
[e, e, u, e, u]
Population:
[p, z, j, l, u]
[x, p, f, c, z]
[n, e, p, a, t]
[k, d, t, w, f]
[z, e, z, o, k]
Population:
[h, m, d, o, v]
[c, z, m, q, o]
[e, t, z, i, o]
[w, d, f, r, t]
[b, e, y, l, f]
Population:
[p, j, l, m, v]
[u, s, o, t, t]
[z, e, b, m, g]
[j, e, e, w, r]
[w, k, d, b, n]
Population:
[w, q, a, o, h]
[n, r, x, i, o]
[h, g, s, h, i]
[p, y, h, o, j]
[g, e, x, z, k]
Population:
[h, e, s, r, m]
[i, e, n, v, e]
[a, e, j, r, c]
[x, d, j, x, z]
[f, k, g, x, s]
Population:
[h, v, s, k, o]
[z, c, o, l, z]
[q, e, b, b, b]
[q, f, j, l, v]
[h, z, j, m, s]
Population:
[h, n, r, u, v]
[h, b, x, o, n]
[f, g, r, z, r]
[c, f, o, h, l]
[x, a, c, l, i]
Population:
[i, e, z, t, c]
[x, v, b, l, z]
[s, e, q, l, e]
[k, e, x, d, j]
[j, r, l, l, h]
Population:
[e, i, g, l, i]
[q, t, k, l, e]
[o, k, b, y, o]
[n, e, j, c, o]
[r, e, l, o, p]
Population:
[h, m, k, p, o]
[j, s, l, l, c]
[m, e, c, l, k]
[x, v, l, b, n]
[y, a, w, l, v]
Population:
[s, b, c, h, j]
[j, e, y, v, p]
[p, d, b, u, z]
[t, e, l, y, q]
[h, l, o, z, e]
Population:
[h, z, g, k, u]
[u, i, g, b, h]
[t, b, c, l, p]
[t, v, z, t, y]
[b, k, s, e, g]
Population:
[o, r, y, x, g]
[y, s, l, l, j]
[c, b, z, f, j]
[j, r, n, p, r]
[p, n, d, b, z]
Population:
[l, y, v, j, f]
[n, m, s, e, y]
[b, e, i, i, x]
[k, l, g, l, g]
[f, b, l, y, q]
Population:
[g, f, e, f, f]
[s, t, a, l, u]
[l, l, t, a, q]
[m, p, k, c, a]
[a, y, c, k, g]
Population:
[r, b, l, v, g]
[m, c, n, v, m]
[f, y, i, n, l]
[v, d, x, p, q]
[e, e, c, d, r]
Population:
[f, s, w, e, r]
[n, e, t, x, h]
[p, w, m, g, w]
[t, z, q, a, h]
[h, e, t, g, p]
Population:
[r, d, y, v, h]
[c, m, l, d, o]
[k, l, l, m, n]
[b, k, s, a, u]
[c, h, p, b, d]
Population:
[r, z, v, h, o]
[t, u, l, o, i]
[f, b, x, y, x]
[w, e, i, j, i]
[s, v, l, j, m]
Population:
[b, c, h, e, z]
[g, r, w, u, s]
[e, c, g, p, k]
[r, e, x, c, n]
[i, d, t, t, v]
Population:
[h, q, h, x, q]
[s, b, q, l, b]
[c, p, l, l, a]
[w, q, z, e, z]
[n, g, k, a, t]
Population:
[n, e, a, t, l]
[y, e, n, g, o]
[u, i, o, l, o]
[r, e, x, g, d]
[y, r, l, r, x]
Population:
[s, z, n, w, n]
[i, e, i, z, u]
[f, a, r, u, o]
[h, e, q, k, o]
[e, u, j, s, o]
Population:
[d, y, p, c, b]
[d, z, u, u, k]
[j, e, h, k, i]
[b, x, k, i, z]
[v, l, b, a, x]
Population:
[i, a, c, h, s]
[s, e, u, f, t]
[h, e, c, a, p]
[j, v, n, w, o]
[s, h, r, l, u]
Population:
[v, e, d, o, e]
[c, z, t, a, e]
[l, y, s, l, j]
[h, x, j, t, o]
[f, p, q, j, c]
Population:
[j, v, i, r, s]
[v, y, i, d, o]
[l, o, f, c, a]
[k, j, f, f, n]
[e, w, m, l, d]
Population:
[c, e, h, s, o]
[r, x, s, k, t]
[a, e, q, e, o]
[v, j, d, y, o]
[t, e, z, s, y]
Population:
[h, t, u, r, l]
[d, u, g, o, m]
[i, z, q, c, o]
[q, e, b, a, o]
[b, u, i, j, f]
Population:
[m, t, o, x, e]
[z, g, g, l, d]
[s, o, u, l, q]
[m, e, o, s, u]
[i, e, j, d, t]
Population:
[y, j, n, l, t]
[f, b, l, n, o]
[o, e, l, t, o]
[u, e, n, b, i]
[j, g, l, p, c]
Population:
[h, v, z, n, w]
[i, v, h, k, z]
[n, v, q, n, p]
[a, j, m, u, l]
[q, n, l, a, i]
Population:
[s, o, l, r, t]
[w, j, h, l, g]
[r, e, f, v, w]
[x, o, e, e, s]
[h, r, a, x, o]
Population:
[q, n, l, k, x]
[q, f, q, z, d]
[h, h, j, k, n]
[h, e, c, p, z]
[v, e, p, t, o]
Population:
[i, z, l, z, a]
[g, e, f, m, w]
[t, e, t, y, e]
[t, e, p, l, o]
[e, r, z, h, o]
Population:
[v, s, w, i, b]
[i, e, j, z, k]
[r, e, e, m, m]
[u, p, b, l, w]
[f, s, u, g, a]
Population:
[j, e, j, b, o]
[w, s, j, p, o]
[z, e, l, w, o]
[j, e, l, m, i]
[d, u, m, c, s]
Population:
[m, e, i, s, l]
[y, z, r, l, f]
[w, e, n, f, b]
[h, e, p, y, o]
[b, z, g, o, m]
Population:
[c, y, z, b, g]
[g, l, l, o, e]
[f, p, u, a, o]
[h, t, l, k, q]
[h, e, f, q, k]
Population:
[g, q, e, v, o]
[h, h, w, y, c]
[m, p, z, i, o]
[s, b, h, x, k]
[l, e, u, q, o]
Population:
[x, k, u, b, e]
[d, t, k, m, i]
[q, e, a, j, v]
[d, e, m, l, o]
[y, w, v, r, p]
Population:
[y, e, z, l, j]
[i, x, a, e, i]
[d, h, k, k, o]
[f, v, z, y, j]
[h, d, u, m, o]
Population:
[e, o, k, l, b]
[n, m, s, a, l]
[l, e, f, t, w]
[a, h, n, g, j]
[k, t, k, g, a]
Population:
[q, q, n, o, h]
[m, e, a, x, t]
[e, e, z, j, l]
[f, q, g, z, w]
[h, e, x, v, n]
Population:
[b, f, q, a, a]
[c, e, f, w, o]
[j, n, o, j, u]
[h, e, l, l, o]
[s, e, e, l, i]
 
```