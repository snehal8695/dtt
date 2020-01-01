package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.Add_User_DAO;
import bean.AddUser_Bean;

/**
 * Servlet implementation class AddUser
 */
@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String name=request.getParameter("name");
		String contact=request.getParameter("contact");
		String email=request.getParameter("email");
		String alise=request.getParameter("aliesname");
		String role=request.getParameter("role");
		System.out.println(name+""+contact+""+email+""+alise+""+role);
		
		AddUser_Bean ab=new AddUser_Bean();
		ab.setRole(role);
		ab.setName(name);
		ab.setContact(contact);
		ab.setEmail(email);
		ab.setAliesname(alise);
		
		int status=Add_User_DAO.insert(ab);
		if(status>0)
		{
			System.out.println("Data added successfully");
			response.sendRedirect("views/AddUser.jsp");
		
		}
		else
		{
			System.out.println("Data not added");
		}
	}

}
