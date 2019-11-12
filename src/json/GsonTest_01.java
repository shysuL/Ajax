package json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;


@WebServlet("/gson01")
public class GsonTest_01 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		System.out.println("gson테스트 01");
		
		// GSON 라이브러리 객체 생성
		Gson gson = new Gson();
		
		// -----toJson()-----
		// Json객체의 stringify()와 같은 기능
		// JAVA데이터를  JSON Text로 변환해줌
		
		// int
		System.out.println(gson.toJson(100));
		
		// String
		System.out.println(gson.toJson("Alice"));
		
		// Long
		System.out.println(gson.toJson(new Long(20)));
		
		// int[]
		int[] arr = {1,2,3,4,5};
		System.out.println(gson.toJson(arr));
		
		// -----fromJson() -----
		// 언마샬링, JSON 객체의 parse() 같은 역할
		
		int n1 = gson.fromJson("123", int.class);
		Integer n2 = gson.fromJson("101101", Integer.class);
		Long n3 = gson.fromJson("5544", Long.class);
		
		boolean n4 = gson.fromJson("true", boolean.class);
		
		String data  = gson.fromJson("\"text data\"", String.class);
		
	}
}
