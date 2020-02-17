package net.codejava;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/register")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		User user = new User();
		
		user.setFullname(request.getParameter("name"));
		user.setEmail(request.getParameter("email"));
		user.setPassword(request.getParameter("password"));
		String confirm_password = request.getParameter("confirm_password");
		
		
		UserDAO userDao = new UserDAO();
		String destPage = "home.jsp";
		try {
			if(userDao.checkUserEmail(user.getEmail())) {
				String message = "User Already Exists";
				request.setAttribute("message", message);
				destPage = "register.jsp";
			}else if(user.getPassword().compareTo(confirm_password)!=0) {
				String message = "Password Mismatch";
				request.setAttribute("message", message);
				destPage = "register.jsp";
			}else {
				user = userDao.insertUser(user);
				if(user.getId()!=-1) {
					HttpSession ses = request.getSession();
					ses.setAttribute("user", user);
				}else {
					String message = "internal error occured";
					request.setAttribute("message", message);
					destPage = "register.jsp";
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			String message = "Internal Error Occured";
			request.setAttribute("message", message);
			destPage = "register.jsp";
			e.printStackTrace();
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(destPage);
		dispatcher.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
