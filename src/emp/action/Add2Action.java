package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class Add2Action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터 값 받기
		
		EmpVO vo = new EmpVO();

		
		vo.setEmployee_id(request.getParameter("employee_id"));
		vo.setFirst_name(request.getParameter("first_name"));
		vo.setLast_name(request.getParameter("last_name"));
		vo.setEmail(request.getParameter("email"));
		vo.setJob_id(request.getParameter("job_id"));
		vo.setHire_date(request.getParameter("hire_date"));
		vo.setDepartment_id(request.getParameter("department_id"));
		
		int cnt = EmpDAO.add(vo);
		
		request.setAttribute("res", cnt);
		
		return "/ex1/add2.jsp";
	}

}
