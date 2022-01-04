package com.aramb.parkandpee.controllers;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping(path="/api/admin")
public class AdminController {
    @GetMapping(path="/whoami", produces= MediaType.APPLICATION_JSON_VALUE)
    public Map<String, String> sayHello() {
        HashMap<String, String> map = new HashMap<>();
        map.put("co-ordinate-x", "27.767695398359844");
        map.put("co-ordinate-y", "85.32595530702329");
        map.put("contact", "12345");
        return map;
    }
    @GetMapping(path="/info", produces= MediaType.APPLICATION_JSON_VALUE)
    public String say() {
        return "AAYUSH SIR K XA HALKHABAR HAJUR KO!";
    }
}
