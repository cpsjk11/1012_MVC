package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {
	
	// 전체 사원들을 반환하는 문장
	public static EmpVO[] getTotal() {
		EmpVO[] ar = null;
		
		// DB 연결 준비(Mapper를 호출하기 위해필요한 객체가 SqlSesiion이다. 이것은 FactoryService를 통해 얻어진 factory를 통해 만든다.)
		SqlSession ss = FactoryService.getFactory().openSession();
		
		// EmpVo[] 의 사원들 정보 넣어주기
		List<EmpVO> list = ss.selectList("emp.total");
		
		// List의 담긴 정보들을 EmpVO[] 에 넣어주기
		if(list != null && !list.isEmpty()) {
			
			ar = new EmpVO[list.size()];
			//list에 있는 요소들을 배열 ar에 복사!
			list.toArray(ar);
		}
		
		ss.close();
		
		return ar;
				
	}
	
	// 추가하는 기능
	public static int add(EmpVO vo) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("emp.add", vo);
		
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		return cnt;
	}
	
	// 검색하는 기능
	public static EmpVO[] search(String searchValue, String searchType) {
		EmpVO[] ar = null;
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("searchValue", searchValue);
		map.put("searchType", searchType);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = ss.selectList("emp.search",map);
		
		if(list != null && !list.isEmpty()) {
			ar = new EmpVO[list.size()];
			
			list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}
}
