package sandwich_condiments.controller;

import net.bytebuddy.implementation.bytecode.constant.DefaultValue;
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
        if(condiment.length==0){
            model.addAttribute("condiment","bạn chưa chon gia vị nào");
            return "condiments";
        }else {
            model.addAttribute("condiment",condiment);
            return "condiments";
        }

    }

}
