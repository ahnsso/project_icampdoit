<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int ucode = (Integer)request.getAttribute("ucode");
	out.println( "<script type='text/javascript'>" );
	if( ucode != -1 ) {
		//세션 등록
		out.println( "location.href='home.do';" );
	} else {
		out.println( "alert( '로그인 실패: 아이디나 비밀번호를 확인해주세요.' );" );
		out.println( "history.back();" );
	}
	out.println( "</script>" );
%>