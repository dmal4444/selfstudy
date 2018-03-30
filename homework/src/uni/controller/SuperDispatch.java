package uni.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SuperDispatch
 */
@WebServlet("*.hw")
public class SuperDispatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HashMap		map = new HashMap();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuperDispatch() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    public void init(ServletConfig config)throws ServletException{
    	Properties prop = new Properties();
    	FileInputStream fin = null;
    	try {
    		fin = new FileInputStream("C:\\Users\\user\\Desktop\\Eclipse\\git\\selfstudy\\homework\\src\\uni\\controller\\RequestMap.properties");
    		prop.load(fin);
    	}
    	catch (Exception e) {
    		e.printStackTrace();
    	}finally {
    		try {
    			fin.close();
    		}
    		catch(Exception e) {		
    		}
    	}
    	
        Enumeration en = prop.keys();  //키 값만 끄집어내는 함수

        while(en.hasMoreElements()){
            String key = (String)en.nextElement();
            String value = (String)prop.get(key);
            try{
                Class tempClass = Class.forName(value);
                Object temp = (SuperAction)tempClass.newInstance();
                map.put(key,temp);
                
            }catch(Exception e){}
        }
        
   }
   

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String fullPath = request.getRequestURI();
        String domain = request.getContextPath();
        String realPath = fullPath.substring(domain.length());
        SuperAction controller = (SuperAction)map.get(realPath);
        if(controller==null){
            return;
        }
        String view = controller.action(request, response);
        try{
            RequestDispatcher rd = request.getRequestDispatcher(view);
            rd.forward(request, response);
            
        }catch(Exception e){}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
