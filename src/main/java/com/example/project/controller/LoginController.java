package com.example.project.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.dto.MemberVO;
import com.example.project.service.LoginService;
 
 
@Controller 
@RequestMapping("/login/*") 
public class LoginController {
   
    @Inject
    LoginService loginService;
    
    // 01. �α��� ȭ�� 
    @RequestMapping("login.do")
    public String login(){
        return "login/login";    // views/member/login.jsp�� ������
    }
    
    // 02. �α��� ó��
    @RequestMapping("loginCheck.do")
    public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session){
        boolean result = loginService.loginCheck(vo, session);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // �α��� ����
            // main.jsp�� �̵�
            mav.setViewName("login/home");
            mav.addObject("msg", "success");
        } else {    // �α��� ����
            // login.jsp�� �̵�
            mav.setViewName("login/login");
            mav.addObject("msg", "failure");
        }
        return mav;
    }
    
    // 03. �α׾ƿ� ó��
    @RequestMapping("logout.do")
    public ModelAndView logout(HttpSession session){
        loginService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("login/login");
        mav.addObject("msg", "logout");
        return mav;
    }
}