package com.example.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/event/*")
public class EventController {
	@RequestMapping("event.do")
	public String event() {
		return "event/event";//event.jsp·Î °¡¶ó
	}
}
