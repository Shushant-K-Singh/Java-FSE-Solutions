package com.cognizant.spring_learn.Exercise4.controller;

import com.cognizant.spring_learn.Exercise4.model.Country;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CountryController {

    @RequestMapping
    public Country getCountryIndia() {

        ClassPathXmlApplicationContext context =
                new ClassPathXmlApplicationContext("country.xml");

        Country country = context.getBean("india", Country.class);

        context.close();

        return country;
    }
}
