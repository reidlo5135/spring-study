package kr.co.picTO.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("memController")
@RequestMapping(value = "/member/*")
public class MemberController {
	
	@GetMapping(value = "/login")
	public String hello(Model model) {
		model.addAttribute("msg", "LOGIN PAGE!!");
		return "login";
	}
	
}
