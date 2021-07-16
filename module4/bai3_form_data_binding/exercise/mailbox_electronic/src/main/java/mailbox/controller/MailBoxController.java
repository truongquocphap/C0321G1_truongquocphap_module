package mailbox.controller;

import mailbox.model.bean.MailBox;
import mailbox.model.repository.IMailBoxRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MailBoxController {
    @GetMapping("")
    public ModelAndView showUpdateFile() {
        List<String> languageList = new ArrayList<>();
        languageList.add("English");
        languageList.add("Vietnamese");
        languageList.add("Japanese");
        languageList.add("Chinese");
        List<Integer> pageSize = new ArrayList<>();
        pageSize.add(5);
        pageSize.add(10);
        pageSize.add(15);
        pageSize.add(25);
        pageSize.add(50);
        pageSize.add(100);
        ModelAndView modelAndView = new ModelAndView("update", "mailBox", iMailBoxRepository.finAll());
        modelAndView.addObject("language", languageList);
        modelAndView.addObject("pageSize", pageSize);
        return modelAndView;
    }

    @Autowired
    IMailBoxRepository iMailBoxRepository;

    @PostMapping("update")
    public ModelAndView showResultUpdate(@ModelAttribute("mailBox") MailBox mailBox) {

        iMailBoxRepository.update(mailBox);
        ModelAndView modelAndView = new ModelAndView("showResultUpdate");
        modelAndView.addObject("mailBox", iMailBoxRepository.finAll());
        return modelAndView;
    }
}
