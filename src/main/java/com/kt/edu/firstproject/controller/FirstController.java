package com.kt.edu.firstproject.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class FirstController {
    @GetMapping("/hi")
    public String niceToMeetYou(Model model) {
        model.addAttribute("username", "jake lee"); //변수 등록
        return "greetings";
    }
    private static final Logger logger = LoggerFactory.getLogger(FirstController.class);

    @GetMapping("/test")
    public String test() {
        logger.info("Test log message");
        return "Test completed";
    }
}
