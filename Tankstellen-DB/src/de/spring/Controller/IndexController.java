package de.spring.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	@RequestMapping("/map_index")
	public ModelAndView index()
	{
		ModelAndView modelAndView = new ModelAndView();
	    modelAndView.setViewName("index");
//	    String message = "Geschafft! Ich bin das erstes Spring MVC Erfolgserlebnis! :-) ";
//	    modelAndView.addObject("message", message);
	    return modelAndView;
	    }
	@RequestMapping("/seiteZwei")
	public ModelAndView seiteZwei() 
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("seiteZwei");
//		String message = "SUCESS!!! Und ein weiterer Erfolg :)";
//		modelAndView.addObject("message", message);
		return modelAndView;
		}
	}
