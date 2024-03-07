import 'dart:async';
import 'dart:io';
import 'dart:math';

class Character {
  String name;
  int health;
  int damage;
  bool isDead = false;

  Character(this.name, this.health, this.damage);

  void attack(Character opponent) {
    if (!opponent.isDead) {
      print('$name menyerang ${opponent.name}!');
      opponent.takeDamage(damage);
      print('${opponent.name} menerima $damage damage. ${opponent.name} memiliki ${opponent.health} hit point tersisa.');
      if (opponent.health <= 0) {
        opponent.isDead = true;
        print('${opponent.name} telah mati!');
      }
    } else {
      print('${opponent.name} sudah mati, tidak dapat diserang lagi!');
    }
  }

  void takeDamage(int damageTaken) {
    health -= damageTaken;
  }

  bool isAlive() {
    return health > 0;
  }
}

class Hero extends Character {
  int maxMana;
  int _mana;

  int get mana => _mana;

  set mana(int value) {
    _mana = value.clamp(0, maxMana);
  }

  Hero(String name, int health, this.maxMana) : _mana = maxMana, super(name, health, 10);

  void castSpell(Character opponent) {
    if (!opponent.isDead) {
      if (mana >= 10) {
        print('$name menggunakan sihir terhadap ${opponent.name}!');
        opponent.takeDamage(30);
        mana -= 10;
        print('${opponent.name} menerima 30 damage. ${opponent.name} memiliki ${opponent.health} hit point tersisa.');
        if (opponent.health <= 0) {
          opponent.isDead = true;
          print('${opponent.name} telah mati!');
        }
      } else {
        print('$name tidak memiliki cukup mana untuk menggunakan sihir!');
      }
    } else {
      print('${opponent.name} sudah mati, tidak dapat diserang lagi!');
    }
  }
}

class Monster extends Character {
  Monster(String name, int health) : super(name, health, 15);

  void roar() {
    print('$name mengaum!');
  }
}

class Game {
  List<Character> characters = [];

  void addCharacter(Character character) {
    characters.add(character);
  }

  void start() async {
    print('Permainan dimulai!');
    await Future.delayed(Duration(seconds: 1));

    while (!isGameOver()) {
      for (var character in characters) {
        if (character is Hero && !character.isDead) {
          print('Giliran Asep!');
          print('Pilih monster yang ingin diserang:');
          for (var i = 0; i < characters.length; i++) {
            if (characters[i] is Monster && !characters[i].isDead) {
              print('${i + 1}. ${characters[i].name}');
            }
          }
          var monsterIndex = int.parse(stdin.readLineSync() ?? '1') - 1;
          var chosenMonster = characters[monsterIndex];
          print('Pilih tindakan yang ingin dilakukan:');
          print('1. Serang monster dengan serangan biasa');
          print('2. Gunakan sihir');
          var action = int.parse(stdin.readLineSync() ?? '1');
          switch (action) {
            case 1:
              character.attack(chosenMonster);
              break;
            case 2:
              character.castSpell(chosenMonster);
              break;
            default:
              print('Pilihan tidak valid. Asep menyerang secara default.');
              character.attack(chosenMonster);
          }
          print('Mana Asep: ${character.mana}');
          await Future.delayed(Duration(seconds: 1));
        } else if (character is Monster && !character.isDead) {
          if (characters.any((c) => c is Hero && c.isAlive())) {
            character.attack(getRandomOpponent(character));
            await Future.delayed(Duration(seconds: 1));
            character.roar();
            await Future.delayed(Duration(seconds: 1));
          }
        }
      }
    }
    if (characters.any((character) => character is Hero && character.isAlive())) {
      print('You win!');
    } else {
      print('Game over!');
    }
  }

  bool isGameOver() {
    return !characters.any((character) => character is Hero && character.isAlive()) ||
        !characters.any((character) => character is Monster && character.isAlive());
  }

  Character getRandomOpponent(Character attacker) {
    var opponents = characters.where((character) => character != attacker && character is Hero && character.isAlive()).toList();
    var randomIndex = Random().nextInt(opponents.length);
    return opponents[randomIndex];
  }
}

void main() {
  var game = Game();

  var heroName = 'Asep';
  var maxMana = 30;

  var hero = Hero(heroName, 175, maxMana);
  var monster1 = Monster('Monster 1', 70);
  var monster2 = Monster('Monster 2', 80);

  game.addCharacter(hero);
  game.addCharacter(monster1);
  game.addCharacter(monster2);

  game.start();
}
