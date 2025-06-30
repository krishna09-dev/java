package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello, World! Spring Boot is working correctly.";
    }

    @GetMapping("/")
    public String home() {
        return "Welcome to the Spring Boot Demo Application!";
    }

}