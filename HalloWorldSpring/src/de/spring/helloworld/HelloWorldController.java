package de.spring.helloworld;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {
	@RequestMapping("/helloWorld")
	public ModelAndView helloWorld()
	{
		ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("helloWorld");
	    String message = "Geschafft! Ich bin dein erstes Spring MVC Erfolgserlebnis! :-) ";
	    modelAndView.addObject("message", message);
	    return modelAndView;
	    }
	@RequestMapping("/weiter")
	public ModelAndView weiter() 
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("weiter");
		String message = "SUCESS!!! Und noch mehr Erfolg :)";
		modelAndView.addObject("message", message);
		return modelAndView;
		}
	}
