package controller.customer;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CustomerDAO;
import vo.CustomerVO;

@WebServlet("/customer/modify.do")
public class ModifyController extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 String custId = req.getParameter("custId");
		 CustomerVO cv = CustomerDAO.getInstance().selectCustomer(custId);
		
		req.setAttribute("cv", cv);
		
		// 포워드
		RequestDispatcher dispatcher = req.getRequestDispatcher("/customer/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String custId  = req.getParameter("custId");
		String name = req.getParameter("name");
		String address   = req.getParameter("address");
		String phone  = req.getParameter("phone");
		
		CustomerVO cv = new CustomerVO();
		cv.setCustId(custId);
		cv.setName(name);
		cv.setAddress(address);
		cv.setPhone(phone);
		
		CustomerDAO.getInstance().updateCustomer(cv);
		
		// 리다이렉트
		resp.sendRedirect("/BookStore2/customer/list.do");
	}
}
