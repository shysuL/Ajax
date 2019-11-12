package json;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dto.Person;


@WebServlet("/gson02123215125")
public class GsonTest_02 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("gson테스트 02");
		
		Gson gson = new Gson();
		
		// ----- toJson() -----
		Person p1 = new Person();
		System.out.println(p1);
		
		String jsonText = gson.toJson(p1);
		System.out.println(jsonText);
		
		System.out.println("------------------");
		
		// ------fromJson() -------
		System.out.println("jsonText : " + jsonText);
		Person p2 = gson.fromJson(jsonText, Person.class);
		
		System.out.println(p2);
		
		System.out.println("------------------");
		HashMap map = new HashMap();
		map.put("A", "Alice");
		map.put("Bob", "blue");
		map.put("p", new Person());
		
		System.out.println(map);
		String jsonText2 = gson.toJson(map);
		System.out.println(jsonText2);
		
	}
}
