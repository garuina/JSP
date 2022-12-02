package kr.co.farmstory2.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.vo.ArticleVO;

@WebServlet("/index.do")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ArticleService service = ArticleService.INSTANCE;
	@Override
	public void init() throws ServletException {
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String cate = req.getParameter("cate");
		
		
		List<ArticleVO> latests = service.selectLatest();
		
		if(latests.size() <15){
			ArticleVO article = new ArticleVO();
			article.setNo(0);
			article.setTitle("최신글이 없습니다.");
			article.setRdate("0");
			
			for(int i=0; i<15; i++){
				latests.add(article);
			}
		}
		
		req.setAttribute("latests", latests);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/index.jsp");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	}
	
}