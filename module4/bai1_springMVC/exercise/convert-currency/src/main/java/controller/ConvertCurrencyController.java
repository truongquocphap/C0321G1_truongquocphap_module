package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RequestMapping("/convert")
@Controller
public class ConvertCurrencyController {
    @GetMapping("/currency")
    public String convert(@RequestParam double usd,@RequestParam double rate, Model model){
        double result=usd*rate;
        model.addAttribute("result",result);
        return "result";
    }
    @GetMapping
    public String showInputUsd(){
        return "input-data";
    }
}
