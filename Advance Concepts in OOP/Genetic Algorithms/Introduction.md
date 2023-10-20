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


