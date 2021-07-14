package com.codegym.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@RequestMapping(value = "/greeting")
@Controller
public class GreetingController {

    @GetMapping(value = "/view")
    public String greeting(@RequestParam String phap, Model model) {
        model.addAttribute("name",phap);
        return "index";
    }
@GetMapping
    public String showName()
{
    return "test";
}
}
