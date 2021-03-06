package com.domino.t1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.domino.t1.member.MemberDTO;


@Component
public class AdminMemberInterceptor extends HandlerInterceptorAdapter {
	
 @Override
public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
	
	 	HttpSession session = request.getSession();
	 	
	 	MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
	 	boolean check = false;
	 	if(memberDTO != null && memberDTO.getMember_id().equals("admin")) {
	 		check = true;
	 	}
	 	else {
	 		request.setAttribute("msg", "관리자 권한이 필요한 서비스 입니다.");
	 		request.setAttribute("path", "../member/memberLogin");
	 		
	 		RequestDispatcher view = request.getRequestDispatcher("../WEB-INF/views/common/result.jsp");
	 		view.forward(request, response);
	 	}
	 	return check;
	 }
}
