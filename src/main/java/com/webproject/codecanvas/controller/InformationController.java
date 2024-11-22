package com.webproject.codecanvas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class InformationController {

    @GetMapping("/information")
    public String Information() {
        return "information";
    }

    @GetMapping("/competitions")
    public String Competitions (){
        return "competitions";
    }

    @GetMapping("/certificates")
    public String Certificates() {
        return "certificates";
    }

}
