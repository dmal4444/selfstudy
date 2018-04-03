package uni.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import uni.dao.tableDAO;
import uni.util.JSONConvert;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/AjaxServlet")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("application/json; charset=UTF-8");
		
		//���̺� �̸��� �޴´�.
		String tableName = request.getParameter("tableName");
		
		tableDAO dao = new tableDAO();
		StringBuffer sb = new StringBuffer();
		PrintWriter out = response.getWriter();
		
		String str_num = request.getParameter("num");
		int num = Integer.parseInt(str_num);
		int num2 = dao.doSomething(num);
		try {
			//table�� �����ϴ��� ���ϴ��� Ȯ���Ѵ�.
			boolean check = dao.checkTable(tableName);
			if(check == false) {
				out.print("���̺��� �������� �ʽ��ϴ�.");
			}
			else {
				HashMap columnList = dao.getCollumnInfo(tableName);
				HashMap tableMap = dao.getTableInfo(tableName, columnList);
				
				//json�� �迭[]�� �����ش�.
				sb.append("["+JSONConvert.changeToJson(tableMap, tableName));
				sb.append(", "+JSONConvert.changeToJson(columnList, tableName+"_column")+"]");
				
				out.print(sb.toString());
				out.close();

			}
		}catch (SQLException e1) {
			e1.printStackTrace();
		}catch (NamingException e1) {
			e1.printStackTrace();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
