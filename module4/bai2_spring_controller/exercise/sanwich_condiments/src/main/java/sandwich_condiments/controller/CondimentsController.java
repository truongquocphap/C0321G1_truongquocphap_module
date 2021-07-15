package sandwich_condiments.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CondimentsController {
    @GetMapping("")
    public String condiments(){
        return "condiments";
    }
    @GetMapping("/save")
    public String save(@RequestParam("condiments") String[] condiment, Model model){
            model.addAttribute("condiment",condiment);
        return "condiments";
    }

}
