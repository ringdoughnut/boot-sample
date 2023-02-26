package com.palladium.sample.springboot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

//@EnableJpaAuditing // Enable JPA Auditing
@SpringBootApplication
public class Application {
    // import package shortcut -> Alt + Enter
    public static void main(String[] args) {

        SpringApplication.run(Application.class, args);
    }
}
