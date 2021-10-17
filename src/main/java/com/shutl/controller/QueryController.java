package com.shutl.controller;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import com.shutl.model.Quote;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class QueryController {

  RestTemplate restTemplate = new RestTemplate();

  @RequestMapping(value = "/q", method = GET)
  public ModelAndView getQueryForm() {
    return new ModelAndView("form", "quote", new Quote());
  }

  @RequestMapping(value = "/q", method = POST)
  public String submitQueryForm(@Valid @ModelAttribute("quote") Quote query, BindingResult result, ModelMap model) {
    if (result.hasErrors()) {
      return "form";
    }

    final String uri = "http://localhost:8080/quote";
    Quote quote = restTemplate.postForObject(uri, query, Quote.class);
    model.addAttribute("quote", quote);
    return "result";
  }
}
