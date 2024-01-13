import 'dart:io';
import 'dart:core';

/**
 * Rudolf zerfällt zu staub.
 * Punkte nicht beachten
 * 
 * --> 1. Hügel der Sonderzeichen zählen (pro Spalte)
 * --> 2. In welcher Zeile befindet sich der 4. höchste Hügel ? 
 * --> 3. Wie breit ist der Hügel in dieser Zeile?
 */


/**
 * Idee.
 *  List<Höhe>
 *   idx Höhe
 *    [0][0]
 *    [1][2]
 *    [2][4]
 *    [3][3]
 *    [4][1] --> 4. Höchste Ebene; Breite: 4, da 4 Einträge >= 1
 *    [5][0]
 */

void main() {
  
  File file = new File('03/input.txt');
  List<String> lines = file.readAsLinesSync();

  // stores height of hill for every coloumn
  List<int> hills = new List.filled(lines[0].length, 0);

  for(String line in lines) {

    // create hills
    int idx = 0;
    line.split('').forEach((character) {
      switch (character) {
        case '.':
          idx++;
          break;
        default:
          hills[idx] += 1;
          idx++;
      }
    });
    
  }

    // get height of hills descending
    List<int> sortedHills = new List.from(hills);
    sortedHills.sort(((a, b) => b.compareTo(a)));
    sortedHills = sortedHills.toSet().toList();

    // compute length of fourthHighestRow
    int lengthOfLevel = 0;
    hills.forEach((element) {
      if(element >= sortedHills[3]) {
        lengthOfLevel += 1;
      }
    });

    print("The answer to question 3 is: " + lengthOfLevel.toString());

}