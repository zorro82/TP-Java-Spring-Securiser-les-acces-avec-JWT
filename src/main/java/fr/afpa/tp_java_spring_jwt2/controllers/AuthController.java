package fr.afpa.tp_java_spring_jwt2.controllers;

import fr.afpa.tp_java_spring_jwt2.models.User;
import fr.afpa.tp_java_spring_jwt2.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public User register(@RequestBody User user) {
        return userService.save(user);
    }
}