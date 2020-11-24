package com.domino.t1.kakao;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
 

@Controller
public class KakaoController {
    

    @RequestMapping(value = "/oauth", produces = "application/json")
    public ModelAndView kakaoLogin(@RequestParam("code") String code, Model model, HttpSession session) {
    	
    	ModelAndView mv = new ModelAndView();
    	
        System.out.println("로그인 할때 임시 코드값");
        //카카오 홈페이지에서 받은 결과 코드
        System.out.println(code);
        System.out.println("로그인 후 결과값");
        
        //카카오 rest api 객체 선언
        Kakao_restApi kr = new Kakao_restApi();
        //결과값을 node에 담아줌
        JsonNode node = kr.getAccessToken(code);
        //결과값 출력
        System.out.println("node:" +node);
 
        //노드 안에 있는 access_token값을 꺼내 문자열로 변환
        String token = node.get("access_token").toString();
        String kakaoUser = node.get("scope").toString();
        String refresh_token = node.get("refresh_token").toString();
        //세션에 담아준다.
        System.out.println("token:"+token);
        System.out.println("refresh_token:"+refresh_token);
       
        session.setAttribute("re", refresh_token);
        mv.addObject("re", refresh_token);
        mv.setViewName("redirect:/");
        
        return mv;
    }
    
    @RequestMapping(value = "/logout", produces = "application/json")
    public String Logout(HttpSession session) {
        //kakao restapi 객체 선언
        Kakao_restApi kr = new Kakao_restApi();
        //노드에 로그아웃한 결과값음 담아줌 매개변수는 세션에 잇는 token을 가져와 문자열로 변환
        JsonNode node = kr.Logout(session.getAttribute("token").toString());
        //결과 값 출력
        System.out.println("로그인 후 반환되는 아이디 : " + node.get("id"));
        //session.invalidate();
        return "redirect:/";
    }    
    
    @RequestMapping(value="loginView")
    public ModelAndView loginView() throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("loginView");
    	return mv;
    }
    
    @RequestMapping(value="kindex")
    public ModelAndView kindex() throws Exception{
    	ModelAndView mv = new ModelAndView();
    	mv.setViewName("kindex");
    	return mv;
    }

  
}


