/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package omjdbc.base;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.swing.JFrame;


/**
 *
 * @author zaurak
 * https://www.roseindia.net/answers/viewqa/Java-Beginners/9118-Java-JTextField-Validation.html
 * https://zeroturnaround.com/rebellabs/java-regular-expressions-cheat-sheet/
 * http://rubular.com/
 */

public class Validation extends JFrame{


    public static boolean validationChamp(String chaineEntree, String expression) {
            CharSequence inputStr = chaineEntree;
            Pattern pattern = Pattern.compile(expression, Pattern.CASE_INSENSITIVE);
            Matcher matcher = pattern.matcher(inputStr);
            return matcher.matches();
    }


}