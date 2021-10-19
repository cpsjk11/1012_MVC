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
	}
	.popup{
		display: none;
	}
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<header>
			<h1>사원들 목록</h1>
		</header>
		<article>
			<table>
				<caption>사원목록</caption>
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
							<input type="button"value="추가" onclick="addWin()"/>
							<input type="button"value="검색" onclick="searchWin()"/>
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
					Object obj = request.getAttribute("ar");
					
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
	<%--추가Popup --%>
	<div id="add_popup" title="사원추가" class="popup">
		<div id="content">
			<form action="Controller3" method="post">
				<label for="s_empno">사번:</label>
				<input type="text" id="s_empno" name="employee_id"/><br/>
				<label for="s_fname">이름:</label>
				<input type="text" id="s_fname" name="first_name"/><br/>
				<label for="s_lanme">성씨:</label>
				<input type="text" id="s_lanme" name="last_name"/><br/>
				<label for="s_email">이메일:</label>
				<input type="text" id="s_email" name="email"/><br/>
				<label for="s_job">직종:</label>
				<input type="text" id="s_job" name="job_id" value="IT_PROG"/><br/>
				<label for="s_hdate">입사일:</label>
				<input type="text" id="s_hdate" name="hire_date"/><br/>
				<label for="s_deptno">부서코드:</label>
				<input type="text" id="s_deptno" name="department_id" value="30"/><br/>		
				<input type="button" value="저장" onclick="send(this.form)">
				<input type="hidden" name="type" value="add"/>
				</form>
		</div>
	</div>
	
	<div id="search_popup" title="사원검색" class="popup">
		<div id="content">
			<form action="Controller3" method="post">
				<select id="searchType" name="searchType">
					<option value="x">선택해주세요</option>
					<option value="0">사번</option>
					<option value="1">이름</option>
					<option value="2">이메일</option>
					<option value="3">부서</option>
				</select>
				<input type="text" id="searchValue" name="searchValue"/><br/>
				<input type="button" value="검색" onclick="search(this.form)">
				<input type="hidden" name="type" value="search"/>
				</form>
		</div>
	</div>
	<script>
	$(function(){
		$( "#s_hdate" ).datepicker({
			dateFormat: 'yy-mm-dd',
			dayNamesMin: ["일","월","화","수","목","금","토"],
			monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월",],
			showMonthAfterYear:true,
		});
	});
		function addWin(){
			 $( "#add_popup" ).dialog();
		}
		
		function send(frm){
			var lname = $("#s_lanme").val();
			var email = $("#s_email").val()
			var job = $("#s_job").val();
			var hdate = $("#s_hdate").val();
			var deptno = $("#s_deptno").val();
			var empno = $("#s_empno").val();
			var fname = $("#s_fname").val();
			
			if($("#s_empno").val().trim().length <= 0){
				alert("사번을 입력해주세요")
				$("#s_empno").val("");
				$("#s_empno").focus();
				return;
			}
			
			if($("#s_lanme").val().trim().length <= 0){
				alert("성을 입력해주세요")
				$("#s_lanme").val("");
				$("#s_lanme").focus();
				return;
			}
		
			if($("#s_email").val().trim().length <= 0){
				alert("이메일을 입력해주세요")
				$("#s_email").val("");
				$("#s_email").focus();
				return;
			}
			
			if($("#s_job").val().trim().length <= 0){
				alert("직종을 입력해주세요")
				$("#s_job").val("");
				$("#s_job").focus();
				return;
			}
			if($("#s_hdate").val().trim().length <= 0){
				alert("입사일을 입력해주세요")
				$("#s_hdate").val("");
				$("#s_hdate").focus();
				return;
			}
			
			if($("#s_deptno").val().trim().length <= 0){
				alert("부서코드를 입력해주세요")
				$("#s_deptno").val("");
				$("#s_deptno").focus();
				return;
			}
			//frm.submit();
			var param = "type=add2&employee_id="+encodeURIComponent(empno)+"&first_name="+encodeURIComponent(fname)+
						"&last_name="+encodeURIComponent(lname)+"&email="+encodeURIComponent(email)+
						"&job_id="+encodeURIComponent(job)+"&hire_date="+encodeURIComponent(hdate)+
						"&department_id="+encodeURIComponent(deptno);
			
			$.ajax({
				url:"Controller3",
				data:param,
				type:"post",
				dataType: "json", // json표기 법을 위해 jsp페이지를 하나 만들어 거기서 표현을 했다.
				}).done(function(data){
					// data안에 chk라는 변수의 값이 1이면 성공
					if(data.chk == 1){
						alert("저장 완료");
						location.href="Controller3";
					}
					else
						alert("뭔가 잘못 되었다!")
				}).fail(function(err){
					console.log(err);
				});
				
			
		}
		function searchWin(){
			 $( "#search_popup" ).dialog();
		}
		function search(frm){
			// 유효성 검사
			if($("#searchType").val().trim() == "x"){
				alert("검색할 키워드를 선택해주세요");
				return;
			}
			if($("#searchValue").val().trim().length <= 0){
				alert("검색할 내용을 입력해주세요");
				$("#searchValue").val("");
				$("#searchValue").focus();
				return;
			}
			
			frm.submit();
		}
	</script>
</body>
</html>