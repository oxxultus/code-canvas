package com.webproject.codecanvas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {

    @GetMapping("/")
    public String Home (){
        return "index";
    }

    @GetMapping("/index")
    public String Index (){
        return "index";
    }

    @GetMapping("/portfolio")
    public String Portfolio (){
        return "portfolio";
    }
}