package calculator.model.service;

import org.springframework.stereotype.Service;

@Service
public class ICalculateImpl implements ICalculate {
    @Override
    public double calculate(double[] number, String operator) {
        double result;
        switch (operator){
            case "+":
                 result=number[0]+number[1];
                 break;
            case "-":
                result=number[0]-number[1];
                break;
            case "*":
                result=number[0]*number[1];
                break;
            case "/":
                result=number[0]/number[1];
                break;
            default:
                throw new IllegalStateException("Unexpected value: " + operator);
        }

       return result;
    }
}
