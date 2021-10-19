package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class TotalAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 먼저 파라미터를 받아햐 하는지 안 받아야 하는지 부터 확인해서 받아야할지 말아야 할지 정해야 한다.
		EmpVO[] ar = EmpDAO.getTotal();
		// 얻어낸 목록의 결과를 request에 ar이라는 이름으로 저장!
		request.setAttribute("ar", ar);
		
		return "/ex1/total.jsp";// 표현하고자 하는 JSP의 경로
	}

}
