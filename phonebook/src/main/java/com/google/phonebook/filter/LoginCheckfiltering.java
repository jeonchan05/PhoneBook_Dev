package com.google.phonebook.filter;

import java.io.IOException;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebFilter("/phonebook/login/*")
public class LoginCheckfiltering implements Filter {
    public LoginCheckfiltering() {
    	
    } // 찬이야 안녕 나 갈게 ... >__< 웃어 ^∇^

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		String logincheck = (String) session.getAttribute("userid");
		if(logincheck == null) {
			res.sendRedirect("/phonebook/beforelogin");
		}else {
			
		}
		chain.doFilter(request, response);
		
	} // ㅜㅜ 배 고 파 !!!....
	// 힘들지마 애기야
	// 진자 갈게 차니야 안녕
	// 내일 맛있는거 먹자 점심에 ㅎㅎㅎ

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
