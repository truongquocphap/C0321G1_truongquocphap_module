package calculator.controller;

import calculator.model.service.ICalculate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CalculatorController {
    @Autowired
    ICalculate iCalculate;
    @GetMapping("")
    public String calculator(){
        return "calculator";
    }
    @GetMapping("calculator")
    public String calculate(@RequestParam("number") double[] number, @RequestParam("operator") String operator, Model model) {
     double result = iCalculate.calculate(number,operator);
model.addAttribute("result",result);
        return "calculator";
    }

}
