package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class SearchAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String searchType = request.getParameter("searchType");
		String searchValue = request.getParameter("searchValue");
		
		EmpVO[] vo = EmpDAO.search(searchValue, searchType);
		
		request.setAttribute("search", vo);
		
		return "/ex1/search.jsp";
	}

}
