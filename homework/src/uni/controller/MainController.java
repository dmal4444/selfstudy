package uni.controller;import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController extends SuperAction{
	
	public String action(HttpServletRequest req, HttpServletResponse resp) {
		
		return "view/main.jsp";
	}

}
