package com.webproject.codecanvas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class CalendarController {

    @GetMapping("/calendar")
    public String community() {
        return "calendar";
    }
}
