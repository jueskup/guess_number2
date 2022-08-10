import 'dart:io';
import 'game.dart';

// top-level function
void main() {
  var result = 0;
  var myList = <int>[];
  int count = 0;

  do {
    count = 0;
    stdout.write('˃ Enter a maximum number to random: ');

    var ipGNum = stdin.readLineSync();
    var gNum = int.tryParse(ipGNum!);

    print('╔════════════════════════════════════════');
    print('║            GUESS THE NUMBER            ');
    print('╟────────────────────────────────────────');

    if (gNum == null) {
      var game = Game();
      do {
        stdout.write('║ Guess the number between 1 and 100: ');
        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          continue;
        }
        count += 1;
        result = game.doGuess(guess);

      }while(result != 1);

    } else {
      var game = Game(maxRandom: gNum);
      do {
        stdout.write('║ Guess the number between 1 and $gNum: ');
        var input = stdin.readLineSync();
        var guess = int.tryParse(input!);

        if (guess == null) {
          continue;
        }
        result = game.doGuess(guess);
        count += 1;
      }while(result != 1);
    }

    var flag = 0;
    if(result == 1){
      do{
        stdout.write('PLay again? (Y/N):');
        var check = stdin.readLineSync();
        if (check == 'n' || check == 'N') {
          myList.add(count);
          break;
        } else if (check == 'Y' || check == 'y') {
          myList.add(count);
          result = 0;
          flag = 1;
        }
      }while(flag != 1);
    }

  }while(result != 1);

  var len = myList.length;

  print('You’ve played $len games');
  for(int i = 0; i < len; i++){
    print('Game #${i+1}: ${myList[i]} guesses');
  }
}


