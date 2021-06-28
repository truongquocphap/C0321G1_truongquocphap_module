package model;

import java.io.IOException;

public class Calcurator {
    public static float calculate(float first,float second,String operand){
        float result;
        switch (operand){
            case "-":
                 result= first-second;
                break;
            case"+":
                 result= first+second;
                 break;
            case "*":
                 result= first*second;
                 break;
            case "/":
                result=first/second;
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + operand);
        }
        return result;
    }
}
