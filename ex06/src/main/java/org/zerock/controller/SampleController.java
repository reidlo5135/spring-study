package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/sample/*")
@Controller
public class SampleController {

	@GetMapping("/all")
	public String doAll() {
		log.info("do all can access everybody");
		
		return "/all";
	}
	
	@GetMapping("/member")
	public String doMember() {
		log.info("logined member");
		
		return "/member";
	}
	
	@GetMapping("/admin")
	public void doAdmin() {
		log.info("admin only");
	}
	
	@GetMapping("/main")
	public void doMain() {
		log.info("main page");
	}
	
	@GetMapping("/public")
	public void doPublic() {
		log.info("public");
	}
	
	@GetMapping("/minor")
	public void doMinor() {
		log.info("minor");
	}
}
