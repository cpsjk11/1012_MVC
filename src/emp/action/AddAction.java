package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EmpDAO;
import mybatis.vo.EmpVO;

public class AddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// request를 통해 객체의 정보를 저장한 후 DAO의 인자 값으로 넣어주자.
		// type add인 경우 이쪽 Action으로 오게 된다.
		EmpVO vo = new EmpVO();
		
		String date = request.getParameter("hire_date");
		date.replace("년", "/");
		date.replace("월", "/");
		date.replace("일", "");
		
		//System.out.println(date);
		
		vo.setEmployee_id(request.getParameter("employee_id"));
		vo.setFirst_name(request.getParameter("first_name"));
		vo.setLast_name(request.getParameter("last_name"));
		vo.setEmail(request.getParameter("email"));
		vo.setJob_id(request.getParameter("job_id"));
		vo.setHire_date(date);
		vo.setDepartment_id(request.getParameter("department_id"));
		
		int cnt = EmpDAO.add(vo);
		
		return null;
	}

}
