package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Member;



@WebServlet("/ajax/test2")
public class AjaxTestController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/ajax/test2.jsp")
			.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<Member> list = new ArrayList<>();
		
		Member m1 = new Member();
		m1.setId("A");
		m1.setPw("Alice");
	
		Member m2 = new Member();
		m2.setId("B");
		m2.setPw("Bob");

		Member m3 = new Member();
		m3.setId("C");
		m3.setPw("Clare");
		
		list.add(m1);
		list.add(m2);
		list.add(m3);
		
		// MODEL값 지정하기
		req.setAttribute("list", list);
		
		// VIEW 지정
		req.getRequestDispatcher("/WEB-INF/views/ajax/result.jsp")
			.forward(req, resp);
		
		
		
	}
}
