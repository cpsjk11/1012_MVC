<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
		width: 600px;
		border-collapse: collapse;
		
	}
	table th, table td{
		border: 1px solid black;
		padding: 4px;
	}
	table caption{
		text-indent: -9999px;
		height: 0;

</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>사원들 검색목록</h1>
		</header>
		<article>
			<table>
				<caption>사원 검색목록</caption>
				<colgroup>
					<col width="50px"/>
					<col width="150px"/>
					<col width="*"/>
					<col width="100px"/>
					<col width="100px"/>
					<col width="50px"/>
				</colgroup>
				<thead>
					<tr>
						<td colspan="6">
							<%-- <input type="button"value="추가" onclick="addWin()"/>--%>
							<input type="button"value="이전으로" onclick="reload()"/>
						</td>
					</tr>
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>이메일</th>
						<th>직종</th>
						<th>입사일</th>
						<th>부서코드</th>
					</tr>
				</thead>
				<tbody>
					<%
				// 첫작업 : VO -- Mapper -- Config -- Factory -- DAO -- Action -- JSP
				// 그 이후부터는 : VO -- Mapper -- DAO -- ACtion -- JSP
					// 컨트롤러에서 forward로 이동되어 왔을 것으므로
					// request에 저장된 정보들 중 "ar"이라는 이름으로
					// 저장된 정보를 얻어낸다.
					Object obj = request.getAttribute("search");
					
					//System.out.println(obj);
					EmpVO[] ar = null;
					if(obj != null){
						ar = (EmpVO[])obj;
					
						for(EmpVO vo : ar){
					%>
						<tr>
							<td><%=vo.getEmployee_id() %></td>
							<td><%=vo.getFirst_name()%></td>
							<td><%=vo.getEmail()%></td>
							<td><%=vo.getJob_id()%></td>
							<td>
							<%if(vo.getHire_date() != null){ %>
							<%=vo.getHire_date().substring(0,10)%></td>
							<%}//if문의 끝 %>
							<td><%=vo.getDepartment_id()%></td>
						</tr>
					<%
						}// for문의 끝
					}//if문의 끝
					%>
				</tbody>
			</table>
		</article>
	</div>
	<form action="Controller3" method="post" name="ff">
		<input type="hidden" name="type" value="total"/>
	</form>
	<script>
		function reload(){
			document.ff.submit();
		}
	</script>
	</body>
	</html>
	