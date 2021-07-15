package dictionary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import dictionary.service.DictionaryService;

@RequestMapping("")
@Controller
public class DictionaryController {
    @Autowired
    DictionaryService dictionaryService;

    @GetMapping("/dictionary")

    public String dictionary(@RequestParam String vocabulary, Model model){

       String result= dictionaryService.convert(vocabulary);
        model.addAttribute("result",result);
        return "result";
    }
    @GetMapping
    public String inputVocabulary(){
        return "input-vocabulary";
    }
}
