package kr.co.picTO.member.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {

	@RequestMapping("/api/test")
	public String test() {
		return "BOOT TEST";
	}

	@RequestMapping(value = "/api/test2")
	public String test2() {
		return "REACT API TEST";
	}
}
