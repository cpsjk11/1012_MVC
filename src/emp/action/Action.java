package emp.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// 인터페이스를 구현하는 클래스들은 무조건 재정의를 해야 한다. 재정의 할때의 접근제한자를 무조건 public이라고 해야하기 떄문에 따로 지정을 해주지 않는다
	String execute(HttpServletRequest request, HttpServletResponse response);
}
