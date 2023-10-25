![image](/images/Advance%20Concepts%20in%20OOP/strategy_design_pattern_2.png)

```java
abstract class Character {
  private WeaponBehaviour weaponBehaviour;

  public void setWeapon(WeaponBehaviour weaponBehaviour){
    this.weaponBehaviour = weaponBehaviour;
  }

  public void fight(){
    weaponBehaviour.useWeapon();
  }
}

class King extends Character {
}

class Queen extends Character {
}

class Troll extends Character {
}

class Knight extends Character {
}

interface WeaponBehaviour{
  public void useWeapon();
}

class AxeBehaviour implements WeaponBehaviour{
  public void useWeapon(){
    System.out.println("Usage of Axe");
  }
}

class SwordBehaviour implements WeaponBehaviour{
  public void useWeapon(){
    System.out.println("Usage of Sword");
  }
}

class KnifeBehaviour implements WeaponBehaviour{
  public void useWeapon(){
    System.out.println("Usage of Knife");
  }
}


class BowAndArrowBehaviour implements WeaponBehaviour{
  public void useWeapon(){
    System.out.println("Usage of Borrow and Arrow");
  }
}

class Main {
  public static void main(String[] args) {
    System.out.println("A King...\n");
    Character king = new King();
    king.setWeapon(new SwordBehaviour());
    king.fight();
    System.out.println("\n");

    System.out.println("A Queen...\n");
    Character queen = new Queen();
    queen.setWeapon(new KnifeBehaviour());
    queen.fight();
    System.out.println("\n");

    System.out.println("A Troll...\n");
    Character troll = new Troll();
    troll.setWeapon(new AxeBehaviour());
    troll.fight();
    System.out.println("\n");

    System.out.println("A Knight...\n");
    Character knight = new Knight();
    knight.setWeapon(new BowAndArrowBehaviour());
    knight.fight();
    System.out.println("\n");
  }
}
```
